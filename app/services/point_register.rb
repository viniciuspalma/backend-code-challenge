class PointRegister
  def initialize(data)
    @data = data
  end

  def self.call(data:)
    new(data).register
  end

  def register
    return [:unregistered, data_validation] unless data_validation_ok?
    return [:unregistered, :over_city_limit] if over_city_delimiter

    point = Point.create(vehicle: vehicle,
      city: city,
      latitude: data[:latitude],
      longitude: data[:longitude],
      timestamp: data[:timestamp],
      current_heading: data[:current_heading])

    [:registered, point]
  end

  private

  attr_reader :data

  def data_validation_ok?
    data_validation == :data_ok
  end

  def data_validation
    @data_validation ||= DataValidation.(data: data)
  end

  def over_city_delimiter
    CityDelimiter.(city: city,
      vehicle_lat: data[:latitude],
      vehicle_lng: data[:longitude])
  end

  def city
    City.first
  end

  def vehicle
    @vehicle ||= EnsureVehicleExists.(
      vehicle_uuid: data[:vehicle_uuid],
      vehicle_type: data[:vehicle_type])
  end
end
