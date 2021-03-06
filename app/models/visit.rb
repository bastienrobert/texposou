# == Schema Information
#
# Table name: visits
#
#  id            :integer          not null, primary key
#  coming_at     :datetime         not null
#  duration      :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :integer
#  user_id       :integer
#

class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
end
