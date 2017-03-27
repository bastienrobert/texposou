class CreateExhibitions < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.text :description
      t.datetime :opening_at
      t.datetime :closing_at
      t.integer :artists_max
      t.float :area_left
      t.float :area_max
      t.float :price_per_day_per_area

      t.timestamps
    end
  end
end
