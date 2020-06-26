# frozen_string_literal: true

puts 'Creating vacancies'

residence = StudentResidence.find_by(name: 'Rep Vegas')
vacancy = residence.vacancies.create!(
  gender: :both,
  description: 'Melhor república da região.',
  monthly_cost: 507.32,
  availability: :soon,
  availability_description: 'Livre à partir de setembro',
  type: :single_room,
  square_meter: 25.2,
  image: image_file('treehouse.jpg')
)
vacancy.commodities << Commodity.find_by(name: 'Suíte')
vacancy.commodities << Commodity.find_by(name: 'Air Conditioning')
