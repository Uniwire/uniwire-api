# frozen_string_literal: true

FactoryBot.define do
  factory :student_residence do
    name { 'Rep Vegas' }
    property_type { :house }
    accomodation_type { :fraternity }
    pet_friendly { false }
    lgbt_friendly { true }
    accept_smoker { false }
    accept_alcoohol { true }
    residents_gender { :both }
    internet { false }
    furniture { :no_furniture }
    capacity { 2 }
  end
end
