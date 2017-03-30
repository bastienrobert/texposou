# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  address     :string
#  zipcode     :integer
#  city        :string
#  area_max    :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ApplicationRecord
  has_many :exhibitions
  has_many :image_places
  belongs_to :user

  accepts_nested_attributes_for :image_places, allow_destroy: true, reject_if: proc { |attributes| attributes['file'].blank? }
end
