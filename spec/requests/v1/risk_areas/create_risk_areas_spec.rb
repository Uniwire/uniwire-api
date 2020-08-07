# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Risk Area', type: :request do
  describe 'POST /risk_areas' do
    context 'when risk area is created' do
      it 'returns status 201 (:created)' do
        post '/v1/risk_areas', :params => { "risk_area": { "type": "flooding", "description": "Inundou" } }

        expect(response).to have_http_status(:created)
      end
    end

    context 'when risk area is not created' do
      before { allow_any_instance_of(RiskArea).to receive(:save).and_return false }

      it 'returns status 422 (:unprocessable_entity)' do
        post '/v1/risk_areas', :params => { "risk_area": { "type": nil, "description": "Inundou" } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
