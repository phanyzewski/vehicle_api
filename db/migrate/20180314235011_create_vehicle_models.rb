class CreateVehicleModels < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_models, primary_key: :vehicle_model_id do |t|
      t.references :vehicle_make
      t.string :name
      t.string :year
      t.string :category
      t.string :trim
      t.timestamps
    end
  end
end
