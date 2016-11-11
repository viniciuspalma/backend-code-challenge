class DataValidation
  def initialize(data)
    @data = data
  end

  def self.call(data:)
    new(data).valid
  end

  def valid
    return :vehicle_type_blank if without_vehicle_type?
    return :vehicle_type_invalid if invalid_vehicle_type_number?
    return :coordinates_blank if without_coordinates?
    return :timestamp_blank if without_timestamp?
    return :current_heading_blank if without_current_heading?
    return :current_heading_invalid if invalid_current_heading?

    return :data_ok
  end

  private

  attr_reader :data

  def without_vehicle_type?
    data[:vehicle_type].blank?
  end

  def invalid_vehicle_type_number?
    !(Vehicle.vehicle_types.values.include?(data[:vehicle_type].to_i))
  end
  def without_coordinates?
    data[:latitude].blank? || data[:longitude].blank?
  end

  def without_timestamp?
    data[:timestamp].blank?
  end

  def without_current_heading?
    data[:current_heading].blank?
  end

  def invalid_current_heading?
    !(data[:current_heading].to_i.between?(0, 359))
  end
end
