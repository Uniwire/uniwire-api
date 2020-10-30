# frozen_string_literal: true

FactoryBot.define do
  factory :student_residence do
    vacancies { [build(:vacancy)] }

    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    property_type { :house }
    accomodation_type { :fraternity }
    pet_friendly { false }
    lgbt_friendly { true }
    accept_smoker { false }
    accept_alcoohol { true }
    residents_gender { :both }
    internet { 10 }
    furniture { :no_furniture }
    capacity { 2 }
  end
end
