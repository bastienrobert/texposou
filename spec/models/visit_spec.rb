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

require 'rails_helper'

RSpec.describe Visit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
