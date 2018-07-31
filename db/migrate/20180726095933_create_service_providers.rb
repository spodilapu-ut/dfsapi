class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.string :title
      t.string :company_name
      t.string :phone
      t.string :email
      t.string :created_by

      t.timestamps
    end
  end
end
