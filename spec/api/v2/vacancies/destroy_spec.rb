require 'rails_helper'

RSpec.describe "vacancies#destroy", type: :request do
  let(:student_residence) { create(:student_residence, vacancies: []) }

  subject(:make_request) do
    jsonapi_delete "/api/v2/vacancies/#{vacancy.id}"
  end

  describe 'basic destroy' do
    let!(:vacancy) { create(:vacancy, student_residence: student_residence) }

    it 'updates the resource' do
      expect(VacancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Vacancy.count }.by(-1)
      expect { vacancy.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
