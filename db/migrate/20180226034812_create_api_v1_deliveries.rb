class CreateApiV1Deliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_deliveries do |t|
      t.references :api_v1_delivery_truck, foreign_key: true
      t.references :api_v1_picking_time, foreign_key: true
      t.references :api_v1_load_time, foreign_key: true
      t.references :api_v1_transportation_time, foreign_key: true
      t.references :api_v1_receive_time, foreign_key: true
      t.references :api_v1_storage_time, foreign_key: true
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
