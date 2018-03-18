class CreateApiV1StorageTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_storage_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :storage_date

      t.timestamps
    end
  end
end
