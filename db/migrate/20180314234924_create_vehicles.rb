class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, primary_key: :vehicle_id do |t|
      t.string :vehicle_identificaiton_number, unique: true
      t.string :owner, null: true
      t.timestamps
    end
      add_foreign_key :vehicle_make, :vehicle_make, primary_key: :vehicle_make_id
      add_foreign_key :vehicle_model, :vehicle_model, primary_key: :vehicle_model_id
  end
end
