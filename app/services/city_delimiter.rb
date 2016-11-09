class CityDelimiter
  def initialize(city, vehicle_lat, vehicle_lng)
    @city = city
    @vehicle_lat = vehicle_lat
    @vehicle_lng = vehicle_lng
  end

  def self.call(city:, vehicle_lat:, vehicle_lng:)
    new(city, vehicle_lat, vehicle_lng).over_limit?
  end

  def over_limit?
    distance = center_city_location.distance_to(vehicle_location)
    distance > city.city_delimiter
  end

  private

  attr_reader :city, :vehicle_lat, :vehicle_lng

  def center_city_location
    new_location(city.center_latitude, city.center_longitude)
  end

  def vehicle_location
    new_location(vehicle_lat, vehicle_lng)
  end

  def new_location(lat, lng)
    Geokit::LatLng.new(lat.to_f, lng.to_f)
  end
end
