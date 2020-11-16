# frozen_string_literal: true

class VacancyResource < ApplicationResource
  attribute :student_residence_id, :integer
  attribute :gender, :string
  attribute :description, :string
  attribute :monthly_cost, :big_decimal
  attribute :availability, :string
  attribute :availability_description, :string
  attribute :type, :string
  attribute :square_meter, :big_decimal
  attribute :image, :string
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  filter :student_residence_id, :integer

  belongs_to :student_residence
end
