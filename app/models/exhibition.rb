class Exhibition < ApplicationRecord

  belongs_to :place
  has_many :visits

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
