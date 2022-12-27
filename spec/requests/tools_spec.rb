# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/tools' do
  let(:place) { create(:place) }
  let(:valid_attributes) do
    attributes_for(:tool, place_id: place.id)
  end

  let(:invalid_attributes) do
    attributes_for(:tool, name: nil)
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Tool.create! valid_attributes
      get tools_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      tool = Tool.create! valid_attributes
      get tool_url(tool), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Tool' do
        expect do
          post tools_url,
            params: { tool: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Tool, :count).by(1)
      end

      it 'renders a JSON response with the new tool', :aggregate_failures do
        post tools_url,
          params: { tool: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Tool' do
        expect do
          post tools_url,
            params: { tool: invalid_attributes }, as: :json
        end.not_to change(Tool, :count)
      end

      it 'renders a JSON response with errors for the new tool', :aggregate_failures do
        post tools_url,
          params: { tool: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'New Name' }
      end

      it 'updates the requested tool' do
        tool = Tool.create! valid_attributes
        patch tool_url(tool),
          params: { tool: new_attributes }, headers: valid_headers, as: :json
        tool.reload
        expect(tool.name).to eq('New Name')
      end

      it 'renders a JSON response with the tool', :aggregate_failures do
        tool = Tool.create! valid_attributes
        patch tool_url(tool),
          params: { tool: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the tool', :aggregate_failures do
        tool = Tool.create! valid_attributes
        patch tool_url(tool),
          params: { tool: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested tool' do
      tool = Tool.create! valid_attributes
      expect do
        delete tool_url(tool), headers: valid_headers, as: :json
      end.to change(Tool, :count).by(-1)
    end
  end
end
