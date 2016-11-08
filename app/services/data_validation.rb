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
    return :timestamp_invalid if invalid_timestamp?
    return :course_blank if without_course?
    return :course_invalid if invalid_course?

    return :data_ok
  end

  private

  attr_reader :data

  def without_vehicle_type?
    data[:vehicle_type].blank?
  end

  def invalid_vehicle_type_number?
    !(data[:vehicle_type].is_a?(Integer) && vehicle_type_number_valid?)
  end

  def vehicle_type_number_valid?
    Vehicle.vehicle_types.values.include?(data[:vehicle_type])
  end

  def without_coordinates?
    data[:latitude].blank? || data[:longitude].blank?
  end

  def without_timestamp?
    data[:timestamp].blank?
  end

  def invalid_timestamp?
    !data[:timestamp].is_a?(Integer)
  end

  def without_course?
    data[:course].blank?
  end

  def invalid_course?
    !(data[:course].is_a?(Integer) && valid_course?)
  end

  def valid_course?
    data[:course].between?(0, 359)
  end
end
