class AddExhibitionToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_reference :participations, :exhibition, foreign_key: true
  end
end
