class CreateVehicleModels < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_models do |t|
      t.string :model_name
      t.timestamps
    end
  end
end
