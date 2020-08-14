# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List Risk Areas', type: :request do
  describe 'GET /v1/risk_areas' do
    context 'when risk area is empty' do
      it 'returns empty array' do
        get '/v1/risk_areas'

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq("[]")
      end
    end

    context 'when risk areas are found' do
      let(:risk_area_1) { create :risk_area }
      let(:risk_area_2) { create :risk_area }

      before {
        risk_area_1.save
        risk_area_2.save
      }

      it 'returns all risk areas' do
        get "/v1/risk_areas"

        expect(response).to have_http_status(:ok)
        expect(assigns(:risk_areas)).to eq([risk_area_1, risk_area_2])
      end
    end
  end
end
