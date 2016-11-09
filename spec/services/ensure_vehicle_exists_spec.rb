require 'rails_helper'

RSpec.describe EnsureVehicleExists do
  describe '.call' do
    context 'when vehicle already exists' do
      let(:vehicle) { create :vehicle }

      it 'returns the vehicle' do
        expect(described_class.(
          vehicle_uuid: vehicle.id,
          vehicle_type: vehicle.vehicle_type)).to eq(vehicle)
      end
    end

    context 'when vehicle doesn\'t exists' do
      let(:vehicle) { create :vehicle }

      it 'returns a new vehicle' do
        expect(described_class.(
          vehicle_uuid: nil,
          vehicle_type: 0)).to_not eq(vehicle)
      end
    end
  end
end
