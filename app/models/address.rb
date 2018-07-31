class Address < ApplicationRecord
	belongs_to :service_provider
	validates_presence_of :address_line, :city, :pincode, :state, :country 
end
