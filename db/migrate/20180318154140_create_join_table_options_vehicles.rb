class CreateJoinTableOptionsVehicles < ActiveRecord::Migration[5.1]
  def change
    create_join_table  :options, :vehicles do |t|
      t.index [:vehicle_id, :option_id]
      t.index [:option_id, :vehicle_id]
      t.references :vehicles
      t.references :options
    end
  end
end
