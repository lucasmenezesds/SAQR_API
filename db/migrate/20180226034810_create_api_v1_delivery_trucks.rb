class CreateApiV1DeliveryTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_delivery_trucks do |t|
      t.references :api_v1_truck, foreign_key: true

      t.timestamps
    end
  end
end
