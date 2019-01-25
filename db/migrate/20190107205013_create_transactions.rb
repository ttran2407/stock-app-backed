class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :status_id
      t.integer :quantity
      t.float :price
      t.string :stock_symbol
      t.string :transaction_type
      t.timestamps
    end
  end
end
