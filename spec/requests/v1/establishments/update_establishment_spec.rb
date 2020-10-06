# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Establishment', type: :request do
  let(:establishment) { create(:establishment) }

  describe 'PUT /v1/establishment/:id' do
    context 'when establishment is not found' do
      let(:id) { -1 }
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

      it 'returns status 404 (:not_found)' do
        put v1_establishment_path(id: id), params: params
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when establishment is found' do
      let(:id) { establishment.id }

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

        it 'returns status 200 (:ok)' do
          put v1_establishment_path(id: id), params: params
          expect(response).to have_http_status(:ok)
        end

        it 'updates the establishment' do
          put v1_establishment_path(id: id), params: params
          establishment.reload

          expect(establishment.name).to eq('Papelaria')
          expect(establishment.description).to eq('A melhor papelaria do bairro')
          expect(establishment.establishment_type).to eq('others')
          expect(establishment.delivery_availability).to eq(true)
          expect(establishment.price).to eq(10.0)
        end
      end
    end
  end
end
