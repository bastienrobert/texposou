# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users_tag_parts
  has_many :art_tags, :through => :users_tag_parts
  has_many :visits

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :adress, presence: true
  validates :city, presence: true
  validates :postal, presence: true
  validates :phone, presence: true

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
