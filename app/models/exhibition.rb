class Exhibition < ApplicationRecord

  belongs_to :place
  has_many :art_tags

end
