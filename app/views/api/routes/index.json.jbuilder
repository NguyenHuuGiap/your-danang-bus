json.data do
  json.routes do
    json.array!(@data) do |route|
      json.(route, :id, :name, :start_time, :stop_time, :frequence)

      json.buses route.buses do |bus|
        json.(bus, :id, :number_plate)
      end

      json.bus_stops route.bus_stops do |bus_stop|
        json.(bus_stop, :id, :name, :latitude, :longitude)
      end
    end

  end
end