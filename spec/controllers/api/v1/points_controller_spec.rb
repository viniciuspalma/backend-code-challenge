require 'rails_helper'

RSpec.describe Api::V1::PointsController, type: :controller do
  describe 'POST /v1/points' do
    context 'when all parameters is ok' do
      let!(:city) { create :city,
        name: 'Snowdonia',
        center_longitude: -3.8544373,
        center_latitude: 52.8815034,
        city_delimiter: 50
      }

      it 'create a point and respond the created record' do
        post :create, params: { point: {
          vehicle_type: 1,
          latitude: 52.8815034,
          longitude: -3.8815034,
          timestamp: 1478719424,
          current_heading: 180 }}
        expect(JSON.parse(response.body)['point']['latitude']).to eq '52.8815034'
      end
    end

    context 'when some parameter isn\'t ok' do
      it 'respond a error message' do
        post :create, params: { point: { vehicle_type: 10 } }
        expect(JSON.parse(response.body)['errors']).to eq 'vehicle_type_invalid'
      end
    end
  end
end
