require 'rails_helper'

RSpec.describe DataValidation do
  describe '.call' do
    let(:data) do
      {
        vehicle_type: 0,
        latitude: 50.0,
        longitude: 50.0,
        timestamp: Time.now.to_i,
        current_heading: 180
      }
    end

    context 'when has a blank vehicle type' do
      it 'returns vehicle type blank message' do
        data[:vehicle_type] = ''
        expect(described_class.(data: data)).to eq(:vehicle_type_blank)
      end
    end

    context 'when has a nil vehicle type' do
      it 'returns vehicle type blank message' do
        data[:vehicle_type] = nil
        expect(described_class.(data: data)).to eq(:vehicle_type_blank)
      end
    end

    context 'when has a non numeric vehicle type' do
      it 'returns vehicle type invalid message' do
        data[:vehicle_type] = 'a'
        expect(described_class.(data: data)).to eq(:vehicle_type_invalid)
      end
    end

    context 'when has a invalid vehicle type' do
      it 'returns vehicle type invalid message' do
        data[:vehicle_type] = 10
        expect(described_class.(data: data)).to eq(:vehicle_type_invalid)
      end
    end

    context 'when has a blank latitude' do
      it 'returns coordinates blank message' do
        data[:latitude] = ''
        expect(described_class.(data: data)).to eq(:coordinates_blank)
      end
    end

    context 'when has a nil latitude' do
      it 'returns coordinates blank message' do
        data[:latitude] = nil
        expect(described_class.(data: data)).to eq(:coordinates_blank)
      end
    end

    context 'when has a blank longitude' do
      it 'returns coordinates blank message' do
        data[:longitude] = ''
        expect(described_class.(data: data)).to eq(:coordinates_blank)
      end
    end

    context 'when has a nil longitude' do
      it 'returns coordinates blank message' do
        data[:longitude] = nil
        expect(described_class.(data: data)).to eq(:coordinates_blank)
      end
    end

    context 'when has a blank timestamp' do
      it 'returns timestamp blank message' do
        data[:timestamp] = ''
        expect(described_class.(data: data)).to eq(:timestamp_blank)
      end
    end

    context 'when has a nil timestamp' do
      it 'returns timestamp blank message' do
        data[:timestamp] = nil
        expect(described_class.(data: data)).to eq(:timestamp_blank)
      end
    end

    context 'when has a non numeric timestamp' do
      it 'returns timestamp invalid message' do
        data[:timestamp] = 'a'
        expect(described_class.(data: data)).to eq(:timestamp_invalid)
      end
    end

    context 'when has a blank current_heading' do
      it 'returns current_heading blank message' do
        data[:current_heading] = ''
        expect(described_class.(data: data)).to eq(:current_heading_blank)
      end
    end

    context 'when has a nil current_heading' do
      it 'returns current_heading blank message' do
        data[:current_heading] = nil
        expect(described_class.(data: data)).to eq(:current_heading_blank)
      end
    end

    context 'when has a non numeric current_heading' do
      it 'returns current_heading invalid message' do
        data[:current_heading] = 'a'
        expect(described_class.(data: data)).to eq(:current_heading_invalid)
      end
    end

    context 'when has a invalid current_heading' do
      it 'returns current_heading blank message' do
        data[:current_heading] = 400
        expect(described_class.(data: data)).to eq(:current_heading_invalid)
      end
    end
  end
end
