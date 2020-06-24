FactoryBot.define do
  factory :characteristic do
    air_conditioning { false }
    exclusive_bathroom { false }
    parking_spot { 2 }
    water_bill { true }
    electricity_bill { false }
    gas_bill { false }
    furnished { :no_furniture }
    furnished_description { 'Não disponível' }
    include_cleaner { false }
    include_cleaner_description { 'Não disponível' }
  end
end
