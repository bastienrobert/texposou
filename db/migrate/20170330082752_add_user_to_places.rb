class AddUserToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :user, foreign_key: true
  end
end
