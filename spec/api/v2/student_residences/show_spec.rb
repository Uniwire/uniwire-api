require 'rails_helper'

RSpec.describe "student_residences#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v2/student_residences/#{student_residence.id}", params: params
  end

  describe 'basic fetch' do
    let!(:student_residence) { create(:student_residence) }

    it 'works' do
      expect(StudentResidenceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('student_residences')
      expect(d.id).to eq(student_residence.id)
    end
  end
end
