class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :zipcode
      t.string :city
      t.float :area_max
      #user
      #resources
      #exhibition
      t.timestamps
    end
  end
end
