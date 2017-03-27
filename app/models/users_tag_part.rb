class UsersTagPart < ApplicationRecord
  belongs_to :user
  belongs_to :art_tag
end
