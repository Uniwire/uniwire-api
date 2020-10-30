require 'rails_helper'

RSpec.describe "vacancies#update", type: :request do
  let(:student_residence) { create(:student_residence, vacancies: []) }

  subject(:make_request) do
    jsonapi_put "/api/v2/vacancies/#{vacancy.id}", payload
  end

  describe 'basic update' do
    let!(:vacancy) { create(:vacancy, student_residence: student_residence) }

    let(:payload) do
      {
        data: {
          id: vacancy.id.to_s,
          type: 'vacancies',
          attributes: {
            gender: :male
          }
        }
      }
    end

    it 'updates the resource' do
      expect(VacancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { vacancy.reload.attributes }
    end
  end
end
