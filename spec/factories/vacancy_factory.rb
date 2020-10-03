# frozen_string_literal: true

FactoryBot.define do
  factory :vacancy do
    gender { :both }
    description { 'Melhor vaga da região.' }
    monthly_cost { 507.32 }
    availability { :available_soon }
    availability_description { 'Livre à partir de setembro' }
    type { :single_room }
    square_meter { 25.2 }
  end
end
