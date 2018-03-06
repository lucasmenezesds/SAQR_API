class CreateApiV1Cities < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_cities do |t|
      t.string :name
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
