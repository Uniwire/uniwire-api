# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Event', type: :request do
  let(:event) { create(:event) }

  describe 'PUT /v1/event/:id' do
    let(:params) do
      {
        event: {
          title: 'Feira estudantil 2020',
          type: 'Feira',
          description: '18 edição da feira estudantil',
          link: 'http://minha-feira-estudantil.com.br',
          date: '21/10/2020',
          start_time: '10am',
          end_time: '10pm'
        }
      }
    end

    context 'when event is not found' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        put v1_event_path(id: id), params: params
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when event is found' do
      let(:id) { event.id }

      context 'when event is valid' do
        it 'returns status 200 (:ok)' do
          put v1_event_path(id: id), params: params
          expect(response).to have_http_status(:ok)
        end

        it 'updates the event' do
          put v1_event_path(id: id), params: params
          event.reload

          expect(event.title).to eq('Feira estudantil 2020')
          expect(event.type).to eq('Feira')
          expect(event.description).to eq('18 edição da feira estudantil')
          expect(event.link).to eq('http://minha-feira-estudantil.com.br')
          expect(event.date).to eq('21/10/2020')
          expect(event.start_time).to eq('10am')
          expect(event.end_time).to eq('10pm')
        end
      end
    end
  end
end
