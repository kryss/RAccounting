# == Schema Information
# Schema version: 20110302005250
#
# Table name: products
#
#  id         :integer         not null, primary key
#  ref        :string(255)
#  desc       :string(255)
#  buy_price  :decimal(, )
#  sell_price :decimal(, )
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
	belongs_to :company
end
