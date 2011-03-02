# == Schema Information
# Schema version: 20110302005250
#
# Table name: orders
#
#  id           :integer         not null, primary key
#  linenum      :integer
#  account_id   :integer
#  product_id   :integer
#  qty          :integer
#  selled_price :decimal(, )     default(-1.0)
#  created_at   :datetime
#  updated_at   :datetime
#

class Order < ActiveRecord::Base
	belongs_to :account
	belongs_to :product
	
end
