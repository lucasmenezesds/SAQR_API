class CreateApiV1Cargos < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_cargos do |t|
      t.references :api_v1_truck, foreign_key: true
      t.references :api_v1_delivery, foreign_key: true

      t.timestamps
    end
  end
end
