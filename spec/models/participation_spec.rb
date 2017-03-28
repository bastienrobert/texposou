# == Schema Information
#
# Table name: participations
#
#  id            :integer          not null, primary key
#  area          :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :integer
#

require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
