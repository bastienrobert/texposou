# == Schema Information
#
# Table name: art_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ArtTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
