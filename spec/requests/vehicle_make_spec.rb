require 'rails_helper'

RSpec.describe 'Vehicle Makes API', type: :request do
  let!(:makes) { FactoryBot.create_list(:vehicle_make, 5) }
  let!(:make_name) { Faker::Vehicle.manufacture }

  let(:vehicle_make_id) { makes.first.vehicle_make_id }

  describe 'GET /vehicle_makes' do
    before { get '/vehicle_makes' }

    it 'returns vehicle makes' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
    it 'returns al;l available vehicle makes' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /vehicle_makes/:id' do
    before { get "/vehicle_makes/#{vehicle_make_id}" }

    context 'when the record exists' do
      it 'returns the vehicle_make' do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      it 'returns the expected vehicle_make' do
        expect(JSON.parse(response.body)['vehicle_make_id']).to eq(vehicle_make_id)
      end
    end

    context 'when the record does not exist' do
      let(:vehicle_make_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Vehicle/)
      end
    end
  end

  describe 'POST /vehicle_makes' do
    context 'when there is a valid request' do
      before { post '/vehicle_makes', params: valid_attributes }
      let(:valid_attributes) { { vehicle_make_id: vehicle_make_id, name: make_name } }

      it 'creates a vehicle_make' do
        expect(JSON.parse(response.body)['name']).to eq(make_name)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
    context 'when there is an invalid request' do
      before { post '/vehicle_makes', params: {} }

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'DELETE /vehicle_makes/:id' do
    before { delete "/vehicle_makes/#{vehicle_make_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
