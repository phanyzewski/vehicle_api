require 'rails_helper'
require 'request_spec_helper'

RSpec.describe VehiclesController, type: :controller do
  let!(:vehicles) { FactoryBot.create_list(:vehicle, 2) }
  let!(:options) { require 'pry'; binding.pry
    vehicles.first.vehicle_model.options }
  let!(:make) { vehicles.first.vehicle_make }
  let!(:model) { vehicles.first.vehicle_model }

  let(:vehicle_id) { vehicles.first.id }

  describe 'GET /vehicles' do
    before { get '/vehicles' }

    it 'returns vehicles' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  xdescribe 'GET /vehicles/:id' do
    before { get "/vehicles/#{vehicle_id}"}

    context 'record exists' do
      it 'returns the vehicle' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(vehicle_id)
      end
    end

    context 'record does not exist' do
      let(:vehicle_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Vehicle not found/)
      end
    end
  end

  xdescribe 'POST /vehicles' do
    context 'valid request' do
      before { post '/vehicles', params: valid_attributes }
      let(:valid_attributes) {
        {
          vin: '123abc',
          vehicle_model: model,
          vehicle_make: make,
          vehicle_options: options
        }
      }

      it 'creates a vehicle' do
        expect(json['vin']).to eq('123abc')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid request' do
      let(:invalid_attributes) {
        {
          vin: vehicles.first.vin,
          vehicle_model: model,
          vehicle_make: make,
          vehicle_options: options
        }
      }
      before { post '/vehicles', params: invalid_attributes }

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Vin already exists/)
      end
    end
  end

  # Test suite for DELETE /vehicles/:id
  xdescribe 'DELETE /vehicles/:id' do
    before { delete "/vehicles/#{vehicle_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
