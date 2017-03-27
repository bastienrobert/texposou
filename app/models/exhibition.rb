class Exhibition < ApplicationRecord

  belongs_to :place
  has_many :visits
  has_many :art_tags
end
