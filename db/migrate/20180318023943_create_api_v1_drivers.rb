class CreateApiV1Drivers < ActiveRecord::Migration[5.1]
  def change
    create_table :api_v1_drivers do |t|
      t.string :name
      t.integer :age
      t.string :contact

      t.timestamps
    end
  end
end
