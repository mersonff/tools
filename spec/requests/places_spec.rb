# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/places' do
  let(:valid_attributes) do
    attributes_for(:place)
  end

  let(:invalid_attributes) do
    attributes_for(:place, name: nil)
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Place.create! valid_attributes
      get places_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      place = Place.create! valid_attributes
      get place_url(place), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Place' do
        expect do
          post places_url,
            params: { place: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Place, :count).by(1)
      end

      it 'renders a JSON response with the new place', :aggregate_failures do
        post places_url,
          params: { place: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Place' do
        expect do
          post places_url,
            params: { place: invalid_attributes }, as: :json
        end.not_to change(Place, :count)
      end

      it 'renders a JSON response with errors for the new place', :aggregate_failures do
        post places_url,
          params: { place: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'New name' }
      end

      it 'updates the requested place' do
        place = Place.create! valid_attributes
        patch place_url(place),
          params: { place: new_attributes }, headers: valid_headers, as: :json
        place.reload
        expect(place.name).to eq('New name')
      end

      it 'renders a JSON response with the place', :aggregate_failures do
        place = Place.create! valid_attributes
        patch place_url(place),
          params: { place: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters', :aggregate_failures do
      it 'renders a JSON response with errors for the place' do
        place = Place.create! valid_attributes
        patch place_url(place),
          params: { place: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested place' do
      place = Place.create! valid_attributes
      expect do
        delete place_url(place), headers: valid_headers, as: :json
      end.to change(Place, :count).by(-1)
    end
  end
end
