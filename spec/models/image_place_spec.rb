# == Schema Information
#
# Table name: image_places
#
#  id                :integer          not null, primary key
#  alt               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  place_id          :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe ImagePlace, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
