# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Establishment', type: :request do
  let(:establishment) { create(:establishment) }

  describe 'GET /v1/establishment/:id' do
    context 'when establishment exists' do
      let(:id) { establishment.id }

      it 'returns http status 200 (:ok)' do
        get v1_establishment_path(id: id)
        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct establishment' do
        get v1_establishment_path(id: id)
        body = JSON.parse(response.body)

        expect(body['id']).to eq(establishment.id)
        expect(body['name']).to eq(establishment.name)
      end
    end

    context 'when establishment does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        get v1_establishment_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not return any establishment' do
        get v1_establishment_path(id: id)
        expect(response.body).to be_empty
      end
    end
  end
end
