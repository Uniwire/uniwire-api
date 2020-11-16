require 'rails_helper'

RSpec.describe "vacancies#create", type: :request do
  let(:student_residence) { create(:student_residence, vacancies: []) }

  subject(:make_request) do
    jsonapi_post "/api/v2/vacancies", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:vacancy)
    end
    let(:payload) do
      {
        data: {
          type: 'vacancies',
          attributes: params.merge({
            student_residence_id: student_residence.id
          })
        }
      }
    end

    it 'works' do
      expect(VacancyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Vacancy.count }.by(1)
    end
  end
end
