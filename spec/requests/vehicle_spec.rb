require 'rails_helper'

RSpec.describe 'Vehicles API', type: :request do
  let!(:vehicles) { FactoryBot.create_list(:vehicle, 5) }
  let!(:make) { vehicles.first.vehicle_make }
  let!(:model) { vehicles.first.vehicle_model }

  let(:vehicle_id) { vehicles.first.id }
  let(:vin) { vehicles.first.vin }

  describe 'GET /vehicles' do
    before { get '/vehicles' }

    it 'returns vehicles' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /vehicles/:id' do
    before { get "/vehicles/#{vehicle_id}" }

    context 'when record exists' do
      it 'returns the vehicle' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['vehicle_id']).to eq(vehicle_id)
      end
    end
    context 'when record does not exist' do
      let(:vehicle_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end
  end

  describe 'POST /vehicles' do
    context 'when valid request' do
      before { post '/vehicles', params: valid_attributes }
      let(:valid_attributes) do
        {
          vin: '123abc',
          vehicle_model_id: model.id,
          vehicle_make_id: make.id
        }
      end

      it 'creates a vehicle' do
        expect(JSON.parse(response.body)['vin']).to eq('123abc')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
    context 'when invalid request' do
      before { post '/vehicles', params: invalid_attributes }
      let(:invalid_attributes) do
        {
          vin: vin,
          vehicle_model_id: model.id,
          vehicle_make_id: make.id
        }
      end

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Vin has already been taken/)
      end
    end
  end

  describe 'DELETE /vehicles/:id' do
    before { delete "/vehicles/#{vehicle_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
