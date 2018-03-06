class AddTransportationTimeCityRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :api_v1_transportation_times, :destination_city,
                  foreign_key: { to_table: :api_v1_cities }

    add_reference :api_v1_transportation_times, :origin_city,
                  foreign_key: { to_table: :api_v1_cities }
  end
end