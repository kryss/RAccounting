class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :ref
      t.string :desc
      t.decimal :buy_price
      t.decimal :sell_price
			t.integer :company_id
      t.timestamps
    end
    add_index :products, [:company_id, :ref], :unique => true
    add_index :products, :desc
  end

  def self.down
    drop_table :products
  end
end
