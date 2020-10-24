class Name=addColumnToBetsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :user_id, :integer
  end
end
