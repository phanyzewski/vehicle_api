class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, primary_key: :vehicle_id do |t|
      t.references :vehicle_make
      t.references :vehicle_model
      t.string :vin, unique: true
      t.string :owner, null: true
      t.timestamps
    end
  end
end
