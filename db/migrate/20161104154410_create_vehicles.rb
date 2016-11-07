class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.integer :vehicle_type

      t.timestamps
    end
  end
end
