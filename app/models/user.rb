class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users_tag_parts
  has_many :art_tags, :through => :users_tag_parts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :all_tags
  # accepts_nested_attributes_for :art_tags, allow_destroy: false

  def all_tags=(names)
    self.art_tags = names.split(",").map do |name|
      ArtTag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.art_tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    ArtTag.find_by_name!(name).users
  end

end
