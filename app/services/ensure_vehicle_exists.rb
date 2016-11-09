class EnsureVehicleExists
  def initialize(vehicle_uuid, vehicle_type)
    @vehicle_uuid = vehicle_uuid
    @vehicle_type = vehicle_type
  end

  def self.call(vehicle_uuid:, vehicle_type:)
    new(vehicle_uuid, vehicle_type).find_or_create_vehicle
  end

  def find_or_create_vehicle
    return find_vehicle if find_vehicle.present?

    create_new_vehicle
  end

  private

  attr_reader :vehicle_uuid, :vehicle_type

  def create_new_vehicle
    Vehicle.create(vehicle_type: vehicle_type)
  end

  def find_vehicle
    Vehicle.find_by(id: vehicle_uuid, vehicle_type: vehicle_type)
  end
end
