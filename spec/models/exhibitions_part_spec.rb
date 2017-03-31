# == Schema Information
#
# Table name: exhibitions_parts
#
#  id            :integer          not null, primary key
#  exhibition_id :integer          not null
#  art_tag_id    :integer          not null
#

require 'rails_helper'

RSpec.describe ExhibitionsPart, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
