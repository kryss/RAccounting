# == Schema Information
# Schema version: 20110302005250
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  type       :integer
#  email      :string(255)
#  note       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
	belongs_to :company
end
