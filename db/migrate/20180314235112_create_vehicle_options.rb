class CreateVehicleOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_options do |t|

      t.timestamps
    end
  end
end
