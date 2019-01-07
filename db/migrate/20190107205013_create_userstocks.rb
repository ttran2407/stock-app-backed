class CreateUserstocks < ActiveRecord::Migration[5.2]
  def change
    create_table :userstocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.timestamps
    end
  end
end
