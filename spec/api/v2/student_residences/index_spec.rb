require 'rails_helper'

RSpec.describe "student_residences#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v2/student_residences", params: params
  end

  describe 'basic fetch' do
    let!(:student_residence1) { create(:student_residence) }
    let!(:student_residence2) { create(:student_residence) }

    it 'works' do
      expect(StudentResidenceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['student_residences'])
      expect(d.map(&:id)).to match_array([student_residence1.id, student_residence2.id])
    end
  end
end
