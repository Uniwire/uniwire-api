FactoryBot.define do
  factory :establishment do
    name { :food }
    description { 'maxime circa cibos' }
    establishment_type { 0 }
    delivery_availability { false }
    price { '9.99' }
  end
end
