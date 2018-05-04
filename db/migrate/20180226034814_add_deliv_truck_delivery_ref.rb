class AddDelivTruckDeliveryRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :api_v1_delivery_trucks, :delivery,
                  foreign_key: { to_table: :api_v1_deliveries }
  end
end