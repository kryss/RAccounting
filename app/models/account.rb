# == Schema Information
# Schema version: 20110302005250
#
# Table name: accounts
#
#  id         :integer         not null, primary key
#  contact_id :integer
#  type       :integer
#  number     :integer
#  ispaid     :boolean         default(TRUE)
#  date       :date
#  datedue    :date
#  taxrate    :integer
#  typepaid   :integer
#  paidat     :date
#  simpleac   :boolean
#  note       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
	belongs_to :company
	belongs_to :contact
	has_many :orders, :dependent => :destroy
end
