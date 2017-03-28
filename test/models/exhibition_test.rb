# == Schema Information
#
# Table name: exhibitions
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :text
#  opening_at             :datetime
#  closing_at             :datetime
#  artists_max            :integer
#  area_left              :float
#  area_max               :float
#  price_per_day_per_area :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  place_id               :integer
#

require 'test_helper'

class ExhibitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
