class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :iexId
      t.timestamps
    end
  end
end
