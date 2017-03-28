# == Schema Information
#
# Table name: visits
#
#  id            :integer          not null, primary key
#  coming_at     :datetime
#  duration      :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :integer
#

class Visit < ApplicationRecord
end
