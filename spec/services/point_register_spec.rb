require 'rails_helper'

RSpec.describe PointRegister do
  describe '.call' do
    context 'when has invalid data' do
      before do
        allow_any_instance_of(described_class).to receive(:data_validation_ok?).and_return(false)
        allow_any_instance_of(described_class).to receive(:data_validation).and_return(:message)
      end

      it 'returns a message with error of data validation' do
        expect(described_class.(data: {})).to eq([:unregistered, :message])
      end
    end

    context 'when has invalid position' do
      before do
        allow_any_instance_of(described_class).to receive(:data_validation_ok?).and_return(true)
        allow_any_instance_of(described_class).to receive(:over_city_delimiter).and_return(true)
      end

      it 'returns a message with error of data validation' do
        expect(described_class.(data: {})).to eq([:unregistered, :over_city_limit])
      end
    end

    context 'when has valid position and data' do
      let(:city) {
        create :city,
          center_latitude: 50.0,
          center_longitude: -3.0,
          city_delimiter: 50.0
      }

      let(:data) {
        {
          vehicle_type: 0,
          latitude: 51.0,
          longitude: -3.0,
          timestamp: Time.now.to_i,
          current_heading: 180
        }
      }

      let(:actual) { described_class.(data: data) }

      before do
        allow_any_instance_of(described_class).to receive(:data_validation_ok?).and_return(true)
        allow_any_instance_of(described_class).to receive(:over_city_delimiter).and_return(false)
      end

      it 'returns a correct message' do
        expect(actual[0]).to eq(:registered)
      end

      it 'returns a correct vehicle_type passed' do
        expect(actual[1].vehicle.vehicle_type).to eq('bus')
      end

      it 'returns a correct latitude passed' do
        expect(actual[1].latitude).to eq(data[:latitude])
      end

      it 'returns a correct longitude passed' do
        expect(actual[1].longitude).to eq(data[:longitude])
      end

      it 'returns a correct timestamp passed' do
        expect(actual[1].timestamp).to eq(data[:timestamp])
      end

      it 'returns a correct current_heading passed' do
        expect(actual[1].current_heading).to eq(data[:current_heading])
      end
    end
  end
end
