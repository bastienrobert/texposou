class ExhibitionsPart < ApplicationRecord
  belongs_to :art_tag
  belongs_to :exhibition
end
