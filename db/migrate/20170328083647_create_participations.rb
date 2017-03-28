class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer :area, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
