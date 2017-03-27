class AddPlaceToExhibitions < ActiveRecord::Migration[5.0]
  def change
    add_reference :exhibitions, :place, foreign_key: true
  end
end
