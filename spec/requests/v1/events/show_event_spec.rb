# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Event', type: :request do
  let(:event) { create(:event) }

  describe 'GET /v1/event/:id' do
    context 'when event exists' do
      let(:id) { event.id }

      it 'returns http status 200 (:ok)' do
        get v1_event_path(id: id)
        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct event' do
        get v1_event_path(id: id)
        body = JSON.parse(response.body)

        expect(body['id']).to eq(event.id)
        expect(body['title']).to eq(event.title)
      end
    end

    context 'when event does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        get v1_event_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not return any event' do
        get v1_event_path(id: id)
        expect(response.body).to be_empty
      end
    end
  end
end
