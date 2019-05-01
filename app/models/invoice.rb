class Invoice < ApplicationRecord
	#has_many :invoice_items, :dependent => :destroy
	#has_one :client, foreign_key: "company"

	serialize :invoice_items, Hash
	#accepts_nested_attributes_for :invoice_items
    #accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
