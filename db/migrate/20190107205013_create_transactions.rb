class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :userstocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :type
      t.integer :quantity
      t.float :price
      t.string :status
      t.timestamps
    end
  end
end
