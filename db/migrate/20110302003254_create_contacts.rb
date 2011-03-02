class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.integer :type
      t.string :email
      t.string :note
			t.integer :company_id
      t.timestamps
    end
    add_index :contacts, [:company_id, :name, :type], :unique => true
    add_index :contacts, [:company_id, :email, :type], :unique => true
    add_index :contacts, :type
  end

  def self.down
    drop_table :contacts
  end
end
