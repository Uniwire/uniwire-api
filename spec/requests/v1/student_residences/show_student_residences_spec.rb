# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Student Residence', type: :request do
  let(:student_residence) { create(:student_residence) }

  describe 'GET /v1/student_residence/:id' do
    context 'when student residence exists' do
      let(:id) { student_residence.id }

      it 'returns http status 200 (:ok)' do
        get v1_student_residence_path(id: id)
        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct student residence' do
        get v1_student_residence_path(id: id)
        body = JSON.parse(response.body)

        expect(body['id']).to eq(student_residence.id)
        expect(body['name']).to eq(student_residence.name)
      end
    end

    context 'when student residence does not exist' do
      let(:id) { -1 }

      it 'returns status 404 (:not_found)' do
        get v1_student_residence_path(id: id)
        expect(response).to have_http_status(:not_found)
      end

      it 'does not return any student_residence' do
        get v1_student_residence_path(id: id)
        expect(response.body).to be_empty
      end
    end
  end
end
