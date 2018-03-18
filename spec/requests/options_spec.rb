require 'rails_helper'

RSpec.describe 'Vehicle Makes API', type: :request do
  let!(:options) { FactoryBot.create_list(:option, 5) }
  let!(:option_name) { Faker::Hipster.words(1).first }
  let!(:option_included) { Faker::Boolean.boolean }
  let(:option_id) { options.first.id }

  describe 'GET /options' do
    before { get '/options' }

    it 'returns options' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
    it 'returns all available options' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /options/:id' do
    before { get "/options/#{option_id}" }

    context 'when the record exists' do
      it 'returns the option' do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      it 'returns the expected option' do
        expect(JSON.parse(response.body)['id']).to eq(option_id)
      end
    end

    context 'when the record does not exist' do
      let(:option_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Option/)
      end
    end
  end

  describe 'POST /options' do
    context 'when there is a valid request' do
      before { post '/options', params: valid_attributes }
      let(:valid_attributes) { { name: option_name, included: option_included } }

      it 'creates an option' do
        expect(JSON.parse(response.body)['name']).to eq(option_name)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
    context 'when there is an invalid request' do
      before { post '/options', params: {} }

      it 'returns a validation failed message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'DELETE /options/:id' do
    before { delete "/options/#{option_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
