class CreateJoinTableOptionsVehicles < ActiveRecord::Migration[5.1]
  def change
    create_join_table  :options, :vehicles do |t|
      t.index [:vehicle_id, :option_id]
      t.index [:option_id, :vehicle_id]
      t.references :vehicle
      t.references :option
    end
  end
end
