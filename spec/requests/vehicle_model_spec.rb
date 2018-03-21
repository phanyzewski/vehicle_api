# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicle Models API', type: :request do
  let!(:models) { FactoryBot.create_list(:vehicle_model, 5) }
  let!(:model_name) { Faker::StarWars.vehicle }

  let(:vehicle_make_id) { models.first.vehicle_make.vehicle_make_id }
  let(:vehicle_model_id) { models.first.id }
  let(:option_id) { models.first.options.first.id }

  describe 'GET /v1/vehicle_models' do
    before { get '/v1/vehicle_models' }

    it 'returns vehicle models' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
    it 'returns all available vehicle models' do
      expect(JSON.parse(response.body)['data'].size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /v1/vehicle_models/:id' do
    before { get "/v1/vehicle_models/#{vehicle_model_id}" }

    context 'when the record exists' do
      it 'returns the vehicle_model' do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      it 'returns the expected vehicle model' do
        expect(JSON.parse(response.body)['data']['id']).to eq(vehicle_model_id.to_s)
      end
    end
    context 'when the record does not exist' do
      let(:vehicle_model_id) { -1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end
  end

  describe 'POST /v1/vehicle_models' do
    context 'when there is a valid request' do
      before { post '/v1/vehicle_models', params: valid_attributes }
      let(:valid_attributes) { { vehicle_make_id: vehicle_make_id, name: model_name } }

      it 'creates a vehicle_model' do
        expect(JSON.parse(response.body)['name']).to eq(model_name)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
    context 'when there is an invalid request' do
      before { post '/v1/vehicle_models', params: {} }

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Vehicle make must exist/)
      end
    end
  end

  describe 'DELETE /v1/vehicle_models/:id' do
    before { delete "/v1/vehicle_models/#{vehicle_model_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'update vehicle model options' do
    before { put "/v1/vehicles/#{vehicle_model_id}/options/#{option_id}", params: valid_attributes }
    let(:valid_attributes) { { option_id: option_id, vehicle_model_ids: vehicle_model_id, option_included: true } }

    context 'when vehicle model option exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the item' do
        vehicle_options = VehicleModel.find_by(vehicle_model_id: vehicle_model_id).options
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
