# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List Establishments', type: :request do
  let!(:first_establishment) { create(:establishment, name: 'First establishment') }
  let!(:second_establishment) { create(:establishment, name: 'Second establishment') }

  describe 'GET /v1/establishments' do
    it 'returns http status 200 (:ok)' do
      get v1_establishments_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns the list of establishments' do
      get v1_establishments_path
      body = JSON.parse(response.body)

      expect(body.size).to eq(2)

      expect(body[0]['id']).to eq(first_establishment.id)
      expect(body[0]['name']).to eq(first_establishment.name)

      expect(body[1]['id']).to eq(second_establishment.id)
      expect(body[1]['name']).to eq(second_establishment.name)
    end
  end
end
