class ArtTag < ApplicationRecord
  has_many :exhibitions_parts
  has_many :exhibitions, :through => :exhibitions_parts
end
