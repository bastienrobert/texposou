class CreateUsersTagParts < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tag_parts do |t|
      t.integer :user_id
      t.integer :art_tag_id

      t.timestamps
    end

    add_index :users_tag_parts, :art_tag_id
    add_index :users_tag_parts, :user_id
  end
end
