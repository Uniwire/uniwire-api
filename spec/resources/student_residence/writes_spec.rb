require 'rails_helper'

RSpec.describe StudentResidenceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'student_residences',
          attributes: attributes_for(:student_residence)
        }
      }
    end

    let(:instance) do
      StudentResidenceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StudentResidence.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:student_residence) { create(:student_residence) }

    let(:payload) do
      {
        data: {
          id: student_residence.id.to_s,
          type: 'student_residences',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StudentResidenceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { student_residence.reload.updated_at }
      # .and change { student_residence.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:student_residence) { create(:student_residence) }

    let(:instance) do
      StudentResidenceResource.find(id: student_residence.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StudentResidence.count }.by(-1)
    end
  end
end
