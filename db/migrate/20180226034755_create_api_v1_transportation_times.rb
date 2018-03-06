class CreateApiV1TransportationTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_transportation_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :transportation_date

      t.timestamps
    end
  end
end
