require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#vehicle_types' do
    it 'return all types of vehicles' do
      expect(described_class.vehicle_types)
        .to eq({'bus'=>0, 'taxi'=>1, 'tram'=>2, 'train'=>3})
    end
  end
end
