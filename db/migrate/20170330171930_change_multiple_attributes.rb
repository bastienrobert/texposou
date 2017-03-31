class ChangeMultipleAttributes < ActiveRecord::Migration[5.0]
  def change

    change_column :participations, :area, :integer, {null: true}
    change_column :places, :area_max, :integer, {null: true}

    add_column :users, :website, :string
    add_column :users, :bio, :string

  end
end
