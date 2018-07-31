class Service < ApplicationRecord
	belongs_to :service_provider
	validates_presence_of :category
end
