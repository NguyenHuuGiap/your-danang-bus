class Bus < ApplicationRecord
  belongs_to :route

  validates :latitude, presence: true
  validates :longitude, presence: true
end
