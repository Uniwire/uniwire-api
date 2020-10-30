require 'rails_helper'

RSpec.describe "student_residences#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v2/student_residences/#{student_residence.id}", payload
  end

  describe 'basic update' do
    let!(:student_residence) { create(:student_residence) }

    let(:payload) do
      {
        data: {
          id: student_residence.id.to_s,
          type: 'student_residences',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StudentResidenceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { student_residence.reload.attributes }
    end
  end
end
