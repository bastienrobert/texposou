class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.datetime :coming_at
      t.timestamp :duration

      t.timestamps
    end
  end
end
