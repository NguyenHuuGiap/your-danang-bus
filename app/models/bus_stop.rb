class BusStop < ApplicationRecord
  NEAR_BY_DISTANCE = 500
  has_many :routes, through: :bus_stops_routes
  has_many :bus_stops_routes, dependent: :destroy

  validates :latitude, presence: true
  validates :longitude, presence: true

  scope :nearby_bus_stops, ->(lat, lng) do
    BusStop.select('*').from(BusStop.select("bus_stops.*, (3959 * acos(cos(radians(#{lat}))
                * cos(radians(bus_stops.latitude))
                * cos(radians(bus_stops.longitude) - radians(#{lng})) + sin(radians(#{lat}))
                * sin(radians(bus_stops.latitude)))) AS distance").from('bus_stops'))
        .where('distance < ?', 500).order('distance ASC')
  end

  def route_to another_bus_stop
    BusStopsRoute.find_by_sql("select distinct A.route_id
      from  bus_stops_routes A,  bus_stops_routes B
      where A.route_id = B.route_id
      and A.bus_stop_id = #{id}
      and B.bus_stop_id = #{another_bus_stop.id}")
  end

end