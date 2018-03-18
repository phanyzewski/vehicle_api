class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.boolean :option_included, default: false
      t.timestamps
    end
  end
end
