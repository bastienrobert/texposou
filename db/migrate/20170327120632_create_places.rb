class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.integer :zipcode, null: false
      t.string :city, null: false
      t.float :area_max, null: false
      #user
      #resources
      #exhibition
      t.timestamps
    end
  end
end
