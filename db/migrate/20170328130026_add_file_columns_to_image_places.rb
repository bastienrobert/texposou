class AddFileColumnsToImagePlaces < ActiveRecord::Migration[5.0]
  def up
    add_attachment :image_places, :file
  end

  def down
    remove_attachment :image_places, :file
  end
end
