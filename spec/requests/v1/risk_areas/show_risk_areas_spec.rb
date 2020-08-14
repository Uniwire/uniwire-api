# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Risk Areas', type: :request do
  describe 'GET /risk_areas/:id' do
    context 'when risk area is not found' do
      it 'returns status 404 (:not_found)' do
        get '/v1/risk_areas/x'

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when risk area is found' do
      let(:risk_area) { build :risk_area }

      it 'returns status 200 (:ok)' do
        get "/v1/risk_areas/#{risk_area.id}"

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
