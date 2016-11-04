class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.integer :type

      t.timestamps
    end
  end
end
