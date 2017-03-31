# == Schema Information
#
# Table name: participations
#
#  id            :integer          not null, primary key
#  area          :integer
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :integer
#  confirm       :boolean          default(FALSE)
#

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
end
