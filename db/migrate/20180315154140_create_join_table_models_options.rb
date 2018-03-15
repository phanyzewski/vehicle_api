class CreateJoinTableModelsOptions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :vehicle_models, :vehicle_options do |t|
      # t.index [:vehicle_model_id, :vehicle_option_id]
      # t.index [:vehicle_option_id, :vehicle_model_id]
    end
  end
end
