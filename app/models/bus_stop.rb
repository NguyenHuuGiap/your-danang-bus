class BusStop < ApplicationRecord
  has_and_belongs_to_many :routes

  validates :latitude, presence: true
  validates :longitude, presence: true
end
