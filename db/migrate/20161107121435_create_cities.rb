class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name
      t.decimal :center_longitude
      t.decimal :center_latitude
      t.decimal :city_delimiter

      t.timestamps
    end
  end
end
