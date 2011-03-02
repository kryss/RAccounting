class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :linenum
      t.integer :account_id
      t.integer :product_id
      t.integer :qty
      t.decimal :selled_price, :default => -1 
      
      t.timestamps
    end
    add_index :orders, :account_id
    add_index :orders, :product_id
  end

  def self.down
    drop_table :orders
  end
end
