class CreateArtTags < ActiveRecord::Migration[5.0]
  def change
    create_table :art_tags do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
