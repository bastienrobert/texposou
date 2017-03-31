# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  lastname               :string           default(""), not null
#  firstname              :string           default(""), not null
#  address                :string
#  city                   :string
#  zipcode                :integer
#  tel                    :string
#  status                 :string           default("visitor"), not null
#  main_status            :string           default("visitor"), not null
#  admin                  :boolean          default(FALSE), not null
#  banned                 :boolean          default(FALSE), not null
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
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  description            :string
#  website                :string
#  bio                    :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :avatar, styles: { square:"400x400", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

STATUS_ARTIST = 'artist'

  scope :artists, -> { where(main_status: STATUS_ARTIST) }


  has_many :users_tag_parts, dependent: :destroy
  has_many :art_tags, :through => :users_tag_parts
  has_many :visits, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :image_users, dependent: :destroy
  accepts_nested_attributes_for :image_users, allow_destroy: true, reject_if: proc { |attributes| attributes['file'].blank? }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :all_tags
  # accepts_nested_attributes_for :art_tags, allow_destroy: false
  attr_accessor :main_status

  def main_status=(status)
    if ['visitor', 'professional', 'particular', 'artist'].include? status
      write_attribute(:main_status, status)
      self.add_status(status)
    else
      write_attribute(:main_status, "visitor")
    end
  end

  def main_status
    super
  end

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

  def has_status?(status)
    if self.status.match(status)
      return true
    else
      return false
    end
  end

  def add_status(status)
    unless self.status.match(status)
      self.status += (" " + status)
    end
  end

  def remove_status(status)
    if self.status.match(status)
      if self.status.split.first == status
        self.status.slice! (status + " ")
      else
        self.status.slice! (" " + status)
      end
    end
  end



  def to_s
    "#{firstname.capitalize} #{lastname.upcase}"
  end

end
