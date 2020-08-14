# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Risk Area', type: :request do
  describe 'PATCH /v1/risk_areas/:id' do
    let(:risk_area) { create :risk_area }

    context 'when risk area is updated' do
      it 'returns status 200 (:ok)' do
        patch "/v1/risk_areas/#{risk_area.id}", :params => { "risk_area": { "description": "Não inunda mais" } }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when risk area is not updated' do
      before { allow_any_instance_of(RiskArea).to receive(:update).and_return false }

      it 'returns status 422 (:unprocessable_entity)' do
        patch "/v1/risk_areas/#{risk_area.id}", :params => { "risk_area": { "description": "Não inunda mais" } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
