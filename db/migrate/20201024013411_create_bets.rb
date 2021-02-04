class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.string :team
      t.string :date
    end
  end
end
