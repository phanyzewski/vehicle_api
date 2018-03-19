class CreateJoinTableOptionsVehicleModels < ActiveRecord::Migration[5.1]
  def change
    create_join_table  :options, :vehicle_models do |t|
      t.index [:vehicle_model_id, :option_id]
      t.index [:option_id, :vehicle_model_id]
      t.references :option
      t.references :vehicle_model
    end
  end
end
