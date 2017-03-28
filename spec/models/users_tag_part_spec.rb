# == Schema Information
#
# Table name: users_tag_parts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  art_tag_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UsersTagPart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
