# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List Student Residences', type: :request do
  let!(:first_student_residence) { create(:student_residence, name: 'First residence') }
  let!(:second_student_residence) { create(:student_residence, name: 'Second residence') }

  describe 'GET /v1/student_residences' do
    it 'returns http status 200 (:ok)' do
      get v1_student_residences_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns the list of student_residences' do
      get v1_student_residences_path
      body = JSON.parse(response.body)

      expect(body.size).to eq(2)

      expect(body[0]['id']).to eq(first_student_residence.id)
      expect(body[0]['name']).to eq('First residence')

      expect(body[1]['id']).to eq(second_student_residence.id)
      expect(body[1]['name']).to eq('Second residence')
    end
  end
end
