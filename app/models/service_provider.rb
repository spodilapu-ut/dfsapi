class ServiceProvider < ApplicationRecord
	has_many :addresses
	has_many :services
	validates_presence_of :title, :company_name, :phone, :email, :created_by
end
