class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :provider_id
      t.text :address_line
      t.string :city
      t.string :pincode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
