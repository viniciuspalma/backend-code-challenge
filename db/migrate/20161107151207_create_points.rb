class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points, id: :uuid do |t|
      t.uuid :vehicle_id, index: true
      t.uuid :city_id, index: true
      t.decimal :latitude
      t.decimal :longitude
      t.integer :timestamp
      t.integer :current_heading

      t.timestamps
    end
  end
end
