class CreateExhibitionsParts < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitions_parts do |t|
      t.integer :exhibition_id, null: false
      t.integer :art_tag_id, null: false
    end

    add_index :exhibitions_parts, :art_tag_id
    add_index :exhibitions_parts, :exhibition_id
  end
end
