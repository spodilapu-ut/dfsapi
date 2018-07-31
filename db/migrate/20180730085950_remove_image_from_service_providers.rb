class RemoveImageFromServiceProviders < ActiveRecord::Migration[5.2]
  def change
    remove_column :service_providers, :image, :blob
  end
end
