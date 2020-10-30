require 'rails_helper'

RSpec.describe "student_residences#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v2/student_residences", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:student_residence).except(:vacancies)
    end

    let(:payload) do
      {
        data: {
          type: 'student_residences',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StudentResidenceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StudentResidence.count }.by(1)
    end
  end
end
