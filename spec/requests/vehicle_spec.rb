# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicles API', type: :request do
  let!(:vehicles) { FactoryBot.create_list(:vehicle, 5) }
  let!(:model) { vehicles.first.vehicle_model }
  let!(:make) { vehicles.first.vehicle_model.vehicle_make }

  let(:vehicle_id) { vehicles.first.id }
  let(:vin) { vehicles.first.vin }
  let(:option_id) { vehicles.first.options.first.id }

  describe 'GET /v1/vehicles' do
    before { get '/v1/vehicles' }

    it 'returns vehicles' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
    it 'returns all available vehicles' do
      expect(JSON.parse(response.body)['data'].size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /v1/vehicles/:id' do
    before { get "/v1/vehicles/#{vehicle_id}" }

    context 'when record exists' do
      it 'returns the vehicle' do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      it 'returns the correct vehicle id' do
        expect(JSON.parse(response.body)['data']['id']).to eq(vehicle_id.to_s)
      end
    end
    context 'when record does not exist' do
      let(:vehicle_id) { -1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end
  end

  describe 'POST /v1/vehicles' do
    context 'when valid request' do
      before { post '/v1/vehicles', params: valid_attributes }
      let(:valid_attributes) do
        {
          vin: '123abc',
          vehicle_model_id: model.vehicle_model_id,
          vehicle_make_id: make.vehicle_make_id
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
      before { post '/v1/vehicles', params: invalid_attributes }
      let(:invalid_attributes) do
        {
          vin: vin,
          vehicle_model_id: model.vehicle_model_id,
          vehicle_make_id: make.vehicle_make_id
        }
      end

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Vin has already been taken/)
      end
    end
  end

  describe 'DELETE /v1/vehicles/:id' do
    before { delete "/v1/vehicles/#{vehicle_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'update vehicle options' do
    before { put "/v1/vehicles/#{vehicle_id}/options/#{option_id}", params: valid_attributes }
    let(:valid_attributes) { { option_id: option_id, vehicle_ids: vehicle_id, option_included: true } }

    context 'when vehicle option exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the item' do
        vehicle_options = Vehicle.find_by(vehicle_id: vehicle_id).options
        updated_option = vehicle_options.select { |o| o.id == option_id }.first
        expect(updated_option.option_included).to be true
      end
    end
    context 'when the option does not exist' do
      let(:option_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Option/)
      end
    end
  end
end
