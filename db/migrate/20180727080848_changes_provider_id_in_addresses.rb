class ChangesProviderIdInAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :provider_id, :service_provider_id
  end
end
