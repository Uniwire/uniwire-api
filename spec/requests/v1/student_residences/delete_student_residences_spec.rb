# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete Student Residence', type: :request do
  let(:student_residence) { create(:student_residence) }

  describe 'DELETE /v1/student_residence/:id' do
    context 'when student residence exists' do
      let(:id) { student_residence.id }

      it 'returns http status 204 (:no_content)' do
        delete v1_student_residence_path(id: id)
        expect(response).to have_http_status(:no_content)
      end

      it 'removes the student residence from the database' do
        expect {
          delete v1_student_residence_path(id: id)
        }.to change(StudentResidence, :count).by(0)
      end
    end

    context 'when student residence does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        delete v1_student_residence_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not delete any student residence' do
        expect {
          delete v1_student_residence_path(id: id)
        }.not_to change(StudentResidence, :count)
      end
    end
  end
end
