require 'rails_helper'

RSpec.describe CityDelimiter do
  describe '.call' do
    let(:city) {
      create :city,
        center_latitude: 50.0,
        center_longitude: -3.0,
        city_delimiter: 50.0
    }

    context 'when location is inside the city' do
      it 'returns true' do
        expect(described_class.(
          city: city, vehicle_lat: 51.0, vehicle_lng: -3.0)).to be_truthy
      end
    end

    context 'when location is inside the city' do
      it 'returns false' do
        expect(described_class.(
          city: city, vehicle_lat: 60.0, vehicle_lng: -10.0)).to be_truthy
      end
    end
  end
end
