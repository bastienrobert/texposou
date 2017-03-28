class CreateImageUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :image_users do |t|
      t.string :alt
      t.string :file
      t.timestamps
    end

    add_reference :image_users, :user, foreign_key: true
  end
end
