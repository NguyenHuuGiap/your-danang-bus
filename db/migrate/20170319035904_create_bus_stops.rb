class CreateBusStops < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    create_join_table :routes, :bus_stops
  end
end
