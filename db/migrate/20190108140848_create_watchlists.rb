class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :stock_symbol
      t.timestamps
    end
  end
end
