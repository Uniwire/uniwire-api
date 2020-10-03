# frozen_string_literal: true

class StudentResidence < ApplicationRecord
  has_many :vacancies, dependent: :destroy, inverse_of: :student_residence
  has_many :pictures

  validates :name, presence: true

  enum property_type: {
    house: 0,
    apartment: 1,
    kitnet: 2
  }

  enum accomodation_type: {
    fraternity: 0,
    pension: 1,
    other: 3
  }

  enum residents_gender: {
    both: 0,
    female: 1,
    male: 2
  }

  enum furniture: {
    no_furniture: 0,
    complete: 1,
    incomplete: 2
  }
end
