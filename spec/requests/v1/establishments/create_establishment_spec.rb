# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Establishment', type: :request do
  describe 'POST /v1/establishments' do
    context 'when establishment is valid' do
      let(:params) do
        {
          establishment: {
            name: 'Papelaria',
            description: 'A melhor papelaria do bairro',
            establishment_type: :others,
            delivery_availability: true,
            price: 10.0
          }
        }
      end

      it 'returns status 201 (:created)' do
        post v1_establishments_path, params: params
        expect(response).to have_http_status(:created)
      end

      it 'creates a new establishment' do
        expect {
          post v1_establishments_path, params: params
        }.to change(Establishment, :count).by(1)
      end
    end

    context 'when establishment is invalid' do
      let(:params) do
        {
          establishment: {
            description: 'A melhor papelaria do bairro',
            establishment_type: :others,
            delivery_availability: true,
            price: 10.0
          }
        }
      end

      it 'returns status 422 (:unprocessable_entity)' do
        post v1_establishments_path, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new establishment' do
        expect {
          post v1_establishments_path, params: params
        }.not_to change(Establishment, :count)
      end
    end
  end
end
