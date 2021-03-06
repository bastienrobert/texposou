# == Schema Information
#
# Table name: image_places
#
#  id                :integer          not null, primary key
#  alt               :string
#  file              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  place_id          :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class ImagePlace < ApplicationRecord
  belongs_to :place
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://images.clipartpanda.com/house-clipart-black-and-white-Kije7g7zT.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
