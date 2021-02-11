class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :matchup
      t.string :odds 
    end
  end
end
