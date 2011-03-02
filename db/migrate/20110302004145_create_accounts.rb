class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :contact_id
      t.integer :type
      t.integer :number
      t.boolean :ispaid, :default => true
      t.date :date
      t.date :datedue
      t.integer :taxrate
      t.integer :typepaid
      t.date :paidat
      t.boolean :simpleac, :default => false
      t.string :note
			t.integer :company_id

      t.timestamps
    end
    add_index :accounts, :contact_id
    add_index :accounts, [:company_id, :number, :type], :unique => true
    add_index :accounts, :ispaid
    add_index :accounts, :date

  end

  def self.down
    drop_table :accounts
  end
end
