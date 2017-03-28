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
end
