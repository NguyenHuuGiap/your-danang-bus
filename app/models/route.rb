class Route < ApplicationRecord
  has_many :bus_stops, through: :bus_stops_routes
  has_many :bus_stops_routes, dependent: :destroy
  has_many :buses

  scope :available_route_ids, ->(from, to) do
    starting_bs = BusStop.nearby_bus_stops from.lat, from.lng
    destination_bs = BusStop.nearby_bus_stops to.lat, to.lng
    routes = Set.new
    starting_bs.each do |start_bs|
      destination_bs.each do |dest_bs|
        bus_stops_routes = start_bs.route_to dest_bs
        bus_stops_routes.each do |bsr|
          routes << bsr.route_id
        end
      end
    end
    routes
  end

end
