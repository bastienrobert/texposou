class ArtTag < ApplicationRecord
  has_many :exhibitions_parts
  has_many :exhibitions, :through => :exhibitions_parts

  has_many :users_tag_parts
  has_many :users, :through => :users_tag_parts
end
