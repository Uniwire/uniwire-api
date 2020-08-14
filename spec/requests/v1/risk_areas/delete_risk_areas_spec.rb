# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Risk Area', type: :request do
  describe 'DELETE /v1/risk_areas/:id' do
    let(:risk_area) { create :risk_area }

    context 'when risk area is deleted' do
      it 'returns status 204 (:no_content)' do
        delete "/v1/risk_areas/#{risk_area.id}"

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when risk area is not deleted' do
      before { allow_any_instance_of(RiskArea).to receive(:destroy!).and_return false }

      it 'returns status 422 (:unprocessable_entity)' do
        delete "/v1/risk_areas/#{risk_area.id}"

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
