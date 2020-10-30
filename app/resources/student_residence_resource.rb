# frozen_string_literal: true

class StudentResidenceResource < ApplicationResource
  attribute :name, :string
  attribute :description, :string
  attribute :property_type, :string
  attribute :accomodation_type, :string
  attribute :pet_friendly, :boolean
  attribute :lgbt_friendly, :boolean
  attribute :accept_smoker, :boolean
  attribute :accept_alcoohol, :boolean
  attribute :residents_gender, :string
  attribute :internet, :integer
  attribute :furniture, :string
  attribute :capacity, :integer
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false


  attribute :vacancies_count, :integer do
    @object.vacancies.count
  end

  has_many :vacancies
end
