require 'rails_helper'

RSpec.describe StudentResidenceResource, type: :resource do
  describe 'serialization' do
    let!(:student_residence) { create(:student_residence) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(student_residence.id)
      expect(data.jsonapi_type).to eq('student_residences')
    end
  end

  describe 'filtering' do
    let!(:student_residence1) { create(:student_residence) }
    let!(:student_residence2) { create(:student_residence) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: student_residence2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([student_residence2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:student_residence1) { create(:student_residence) }
      let!(:student_residence2) { create(:student_residence) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            student_residence1.id,
            student_residence2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            student_residence2.id,
            student_residence1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
