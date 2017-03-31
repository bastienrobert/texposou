# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  address     :string           not null
#  zipcode     :integer          not null
#  city        :string           not null
#  area_max    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Place < ApplicationRecord
  has_many :exhibitions, dependent: :destroy
  has_many :image_places, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :image_places, allow_destroy: true, reject_if: proc { |attributes| attributes['file'].blank? }
end
