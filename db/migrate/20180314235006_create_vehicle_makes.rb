class CreateVehicleMakes < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_makes, primary_key: :vehicle_make_id do |t|
      t.string :name
      t.timestamps
    end
  end
end
