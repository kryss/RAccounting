# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110302005250) do

  create_table "accounts", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "type"
    t.integer  "number"
    t.boolean  "ispaid",     :default => true
    t.date     "date"
    t.date     "datedue"
    t.integer  "taxrate"
    t.integer  "typepaid"
    t.date     "paidat"
    t.boolean  "simpleac",   :default => false
    t.string   "note"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["company_id", "number", "type"], :name => "index_accounts_on_company_id_and_number_and_type", :unique => true
  add_index "accounts", ["contact_id"], :name => "index_accounts_on_contact_id"
  add_index "accounts", ["date"], :name => "index_accounts_on_date"
  add_index "accounts", ["ispaid"], :name => "index_accounts_on_ispaid"

  create_table "companies", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["email"], :name => "index_companies_on_email", :unique => true
  add_index "companies", ["reset_password_token"], :name => "index_companies_on_reset_password_token", :unique => true

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.integer  "type"
    t.string   "email"
    t.string   "note"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["company_id", "email", "type"], :name => "index_contacts_on_company_id_and_email_and_type", :unique => true
  add_index "contacts", ["company_id", "name", "type"], :name => "index_contacts_on_company_id_and_name_and_type", :unique => true
  add_index "contacts", ["type"], :name => "index_contacts_on_type"

  create_table "orders", :force => true do |t|
    t.integer  "linenum"
    t.integer  "account_id"
    t.integer  "product_id"
    t.integer  "qty"
    t.decimal  "selled_price", :default => -1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["account_id"], :name => "index_orders_on_account_id"
  add_index "orders", ["product_id"], :name => "index_orders_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "ref"
    t.string   "desc"
    t.decimal  "buy_price"
    t.decimal  "sell_price"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["company_id", "ref"], :name => "index_products_on_company_id_and_ref", :unique => true
  add_index "products", ["desc"], :name => "index_products_on_desc"

end
