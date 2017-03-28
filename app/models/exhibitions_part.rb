# == Schema Information
#
# Table name: exhibitions_parts
#
#  id            :integer          not null, primary key
#  exhibition_id :integer
#  art_tag_id    :integer
#

class ExhibitionsPart < ApplicationRecord
  belongs_to :art_tag
  belongs_to :exhibition
end
