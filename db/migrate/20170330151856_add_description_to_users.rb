class AddDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :description
    end
  end
end
