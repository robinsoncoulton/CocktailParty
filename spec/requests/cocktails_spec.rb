# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cocktails API', type: :request do
  # initialize test data
  let!(:cocktails) { create_list(:cocktail, 10) }
  let(:cocktail_id) { cocktails.first.id }

  # Test suite for GET /cocktails
  describe 'GET /cocktails' do
    # make HTTP get request before each example
    before { get '/cocktails' }

    it 'returns cocktails' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cocktails/:id
  describe 'GET /cocktails/:id' do
    before { get "/cocktails/#{cocktail_id}" }

    context 'when the record exists' do
      it 'returns the cocktail' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(cocktail_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:cocktail_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cocktail/)
      end
    end
  end

  # Test suite for POST /cocktails
  describe 'POST /cocktails' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/cocktails', params: valid_attributes }

      it 'creates a cocktail' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/cocktails', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /cocktails/:id
  describe 'PUT /cocktails/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/cocktails/#{cocktail_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /cocktails/:id
  describe 'DELETE /cocktails/:id' do
    before { delete "/cocktails/#{cocktail_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
