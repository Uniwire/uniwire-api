require 'rails_helper'

RSpec.describe VacancyResource, type: :resource do
  let(:student_residence) { create(:student_residence, vacancies: []) }

  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'vacancies',
          attributes: attributes_for(:vacancy),
          relationships: {
            student_residence: {
              data: {
                type: 'student_residences',
                id: student_residence.id
              }
            }
          }
        }
      }
    end

    let(:instance) do
      VacancyResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Vacancy.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:vacancy) { create(:vacancy, student_residence: student_residence) }

    let(:payload) do
      {
        data: {
          id: vacancy.id.to_s,
          type: 'vacancies',
          attributes: {
            gender: :female
          }
        }
      }
    end

    let(:instance) do
      VacancyResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { vacancy.reload.updated_at }.and change { vacancy.gender }.to('female')
    end
  end

  describe 'destroying' do
    let!(:vacancy) { create(:vacancy, student_residence: student_residence) }

    let(:instance) do
      VacancyResource.find(id: vacancy.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Vacancy.count }.by(-1)
    end
  end
end
