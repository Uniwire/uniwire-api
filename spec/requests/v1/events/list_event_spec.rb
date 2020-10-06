# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List Events', type: :request do
  let!(:first_event) { create(:event, title: 'First event') }
  let!(:second_event) { create(:event, title: 'Second event') }

  describe 'GET /v1/events' do
    it 'returns http status 200 (:ok)' do
      get v1_events_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns the list of events' do
      get v1_events_path
      body = JSON.parse(response.body)

      expect(body.size).to eq(2)

      expect(body[0]['id']).to eq(first_event.id)
      expect(body[0]['title']).to eq('First event')

      expect(body[1]['id']).to eq(second_event.id)
      expect(body[1]['title']).to eq('Second event')
    end
  end
end
