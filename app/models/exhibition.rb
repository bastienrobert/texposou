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
#require 'elasticsearch/model'

class Exhibition < ApplicationRecord

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  belongs_to :place
  has_many :visits
  has_many :participations

  has_many :exhibitions_parts
  has_many :art_tags, :through => :exhibitions_parts
  accepts_nested_attributes_for :art_tags, allow_destroy: false, reject_if: proc { |attributes| attributes['name'].blank? }

  def all_tags=(names)
    self.art_tags = names.split(",").map do |name|
        ArtTag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.art_tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    ArtTag.find_by_name!(name).exhibitions
  end

end
