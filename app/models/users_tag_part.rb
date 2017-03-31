# == Schema Information
#
# Table name: users_tag_parts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  art_tag_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersTagPart < ApplicationRecord
  belongs_to :user
  belongs_to :art_tag
end
