class CreateApiV1Trucks < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_trucks do |t|
      t.references :api_v1_driver, foreign_key: true
      t.string :model

      t.timestamps
    end
  end
end
