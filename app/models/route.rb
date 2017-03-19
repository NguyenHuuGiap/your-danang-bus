class Route < ApplicationRecord
  has_and_belongs_to_many :bus_stops
  has_many :buses
end
