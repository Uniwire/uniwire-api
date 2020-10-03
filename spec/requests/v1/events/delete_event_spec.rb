# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Event', type: :request do
  let(:event) { create(:event) }

  describe 'DELETE /v1/event/:id' do
    context 'when event exists' do
      let(:id) { event.id }

      it 'returns http status 204 (:no_content)' do
        delete v1_event_path(id: id)
        expect(response).to have_http_status(:no_content)
      end

      it 'removes the event from the database' do
        expect {
          delete v1_event_path(id: id)
        }.to change(Event, :count).by(0)
      end
    end

    context 'when event does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        delete v1_event_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not delete any event' do
        expect {
          delete v1_event_path(id: id)
        }.not_to change(Event, :count)
      end
    end
  end
end
