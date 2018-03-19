class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, primary_key: :vehicle_id do |t|
      t.references :vehicle_model
      t.references :vehicle_make
      t.string :vin, unique: true
      t.string :owner
      t.integer :mileage
      t.timestamps
    end
  end
end
