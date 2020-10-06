# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Event', type: :request do
  describe 'POST /v1/events' do
    context 'when event is valid' do
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

      it 'returns status 201 (:created)' do
        post v1_events_path, params: params
        expect(response).to have_http_status(:created)
      end

      it 'creates a new event' do
        expect {
          post v1_events_path, params: params
        }.to change(Event, :count).by(1)
      end
    end

    context 'when event is invalid' do
      let(:params) do
        {
          event: {
            type: 'Feira',
            description: '18 edição da feira estudantil',
            link: 'http://minha-feira-estudantil.com.br',
            date: Date.current,
            start_time: '10am',
            end_time: '10pm'
          }
        }
      end

      it 'returns status 422 (:unprocessable_entity)' do
        post v1_events_path, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new event' do
        expect {
          post v1_events_path, params: params
        }.not_to change(Event, :count)
      end
    end
  end
end
