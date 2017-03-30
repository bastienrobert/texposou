class ChangeMultipleAttributes < ActiveRecord::Migration[5.0]
  def change

    change_column :participations, :area, :integer, {null: true}
    change_column :places, :area_max, :integer, {null: true}

  end
end
