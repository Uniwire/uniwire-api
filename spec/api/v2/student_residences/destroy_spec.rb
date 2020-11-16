require 'rails_helper'

RSpec.describe "student_residences#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v2/student_residences/#{student_residence.id}"
  end

  describe 'basic destroy' do
    let!(:student_residence) { create(:student_residence) }

    it 'updates the resource' do
      expect(StudentResidenceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StudentResidence.count }.by(-1)
      expect { student_residence.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
