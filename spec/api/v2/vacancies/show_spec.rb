require 'rails_helper'

RSpec.describe "vacancies#show", type: :request do
  let(:params) { {} }
  let(:student_residence) { create(:student_residence, vacancies: []) }

  subject(:make_request) do
    jsonapi_get "/api/v2/vacancies/#{vacancy.id}", params: params
  end

  describe 'basic fetch' do
    let!(:vacancy) { create(:vacancy, student_residence: student_residence) }

    it 'works' do
      expect(VacancyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('vacancies')
      expect(d.id).to eq(vacancy.id)
    end
  end
end
