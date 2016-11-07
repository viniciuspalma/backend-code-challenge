class Vehicle < ApplicationRecord
  has_many :points
  
  enum vehicle_type: [:bus, :taxi, :tram, :train]
end
