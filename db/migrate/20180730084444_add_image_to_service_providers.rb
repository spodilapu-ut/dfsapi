class AddImageToServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_providers, :image, :blob
  end
end
