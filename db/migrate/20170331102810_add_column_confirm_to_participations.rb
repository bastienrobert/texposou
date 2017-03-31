class AddColumnConfirmToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_column :participations, :confirm, :boolean, {default: false}
  end
end
