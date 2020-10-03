# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Student Residence', type: :request do
  describe 'POST /v1/student_residences' do
    context 'when student residence is valid' do
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

      it 'returns status 201 (:created)' do
        post v1_student_residences_path, params: params
        expect(response).to have_http_status(:created)
      end

      it 'creates a new student residence' do
        expect {
          post v1_student_residences_path, params: params
        }.to change(StudentResidence, :count).by(1)
      end
    end

    context 'when student residence is invalid' do
      let(:params) do
        {
          student_residence: {
            description: 'Uma república nova no pedaço',
            property_type: :house,
            furniture: :no_furniture,
            capacity: 3
          }
        }
      end

      it 'returns status 422 (:unprocessable_entity)' do
        post v1_student_residences_path, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new student residence' do
        expect {
          post v1_student_residences_path, params: params
        }.not_to change(StudentResidence, :count)
      end
    end
  end
end
