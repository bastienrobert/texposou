# == Schema Information
#
# Table name: art_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtTag < ApplicationRecord
  has_many :exhibitions_parts
  has_many :exhibitions, :through => :exhibitions_parts

  has_many :users_tag_parts
  has_many :users, :through => :users_tag_parts
end
