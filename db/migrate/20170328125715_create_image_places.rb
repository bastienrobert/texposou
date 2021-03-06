class CreateImagePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :image_places do |t|
      t.string :alt
      t.string :file
      t.timestamps
    end

    add_reference :image_places, :place, foreign_key: true
  end
end
