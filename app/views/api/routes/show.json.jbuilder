json.data do
  json.route do
      json.(@data, :id, :name, :start_time, :stop_time, :frequence)

      json.buses @data.buses do |bus|
        json.(bus, :id, :number_plate)
      end

      json.bus_stops @data.bus_stops do |bus_stop|
        json.(bus_stop, :id, :name, :latitude, :longitude)
      end
  end
end