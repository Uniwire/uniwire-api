# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Establishment', type: :request do
  let(:establishment) { create(:establishment) }

  describe 'DELETE /v1/establishment/:id' do
    context 'when establishment exists' do
      let(:id) { establishment.id }

      it 'returns http status 204 (:no_content)' do
        delete v1_establishment_path(id: id)
        expect(response).to have_http_status(:no_content)
      end

      it 'removes the establishment from the database' do
        expect {
          delete v1_establishment_path(id: id)
        }.to change(Establishment, :count).by(0)
      end
    end

    context 'when establishment does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        delete v1_establishment_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not delete any establishment' do
        expect {
          delete v1_establishment_path(id: id)
        }.not_to change(Establishment, :count)
      end
    end
  end
end
