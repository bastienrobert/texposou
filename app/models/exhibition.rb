class Exhibition < ApplicationRecord
  belongs_to :place
  has_many :visits
end
