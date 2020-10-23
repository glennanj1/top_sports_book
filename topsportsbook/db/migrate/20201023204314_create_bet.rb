class CreateBet < ActiveRecord::Migration[5.2]
  def change
    create_table :bet do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
