# frozen_string_literal: true

FactoryBot.define do
  factory :student_residence do
    vacancies { [build(:vacancy)] }

    name { 'Rep Vegas' }
    description { 'Labore exercitation excepteur aliqua nulla eu eu id tempor nostrud. Est irure consequat cillum eiusmod irure ut laborum excepteur veniam. Aliquip reprehenderit labore mollit ea ea reprehenderit occaecat in. Occaecat reprehenderit qui ullamco magna magna labore magna reprehenderit reprehenderit voluptate elit ipsum.' }
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
