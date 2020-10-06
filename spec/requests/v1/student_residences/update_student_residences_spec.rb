# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Student Residence', type: :request do
  let(:student_residence) { create(:student_residence) }

  describe 'PUT /v1/student_residence/:id' do
    let(:params) do
      {
        student_residence: {
          name: 'Nova república',
          description: 'Uma república nova no pedaço',
          property_type: :house,
          accomodation_type: :fraternity,
          pet_friendly: true,
          lgbt_friendly: true,
          accept_smoker: false,
          accept_alcoohol: false,
          residents_gender: :both,
          internet: 100,
          furniture: :no_furniture,
          capacity: 3
        }
      }
    end

    context 'when student residence is not found' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        put v1_student_residence_path(id: id), params: params
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when student residence is found' do
      let(:id) { student_residence.id }

      context 'when student residence is valid' do
        it 'returns status 200 (:ok)' do
          put v1_student_residence_path(id: id), params: params
          expect(response).to have_http_status(:ok)
        end

        it 'updates the student_residence' do
          put v1_student_residence_path(id: id), params: params
          student_residence.reload

          expect(student_residence.name).to eq('Nova república')
          expect(student_residence.description).to eq('Uma república nova no pedaço')
          expect(student_residence.property_type).to eq('house')
          expect(student_residence.accomodation_type).to eq('fraternity')
          expect(student_residence.pet_friendly).to eq(true)
          expect(student_residence.lgbt_friendly).to eq(true)
          expect(student_residence.accept_smoker).to eq(false)
          expect(student_residence.accept_alcoohol).to eq(false)
          expect(student_residence.residents_gender).to eq('both')
          expect(student_residence.internet).to eq(100)
          expect(student_residence.furniture).to eq('no_furniture')
          expect(student_residence.capacity).to eq(3)
        end
      end
    end
  end
end
