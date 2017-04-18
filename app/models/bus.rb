class Bus < ApplicationRecord
  belongs_to :route

  scope :available_buses, ->(from, to) do
    route_ids = Route.available_route_ids from, to
    Route.includes(:buses, :bus_stops).where(id: route_ids.to_a)
  end

end
