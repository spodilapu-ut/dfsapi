class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :service_provider_id
      t.string :category

      t.timestamps
    end
  end
end
