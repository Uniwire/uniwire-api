# frozen_string_literal: true

puts 'Creating student residences...'

StudentResidence.create!(
  name: 'Rep Vegas',
  property_type: :house,
  accomodation_type: :fraternity,
  pet_friendly: false,
  lgbt_friendly: true,
  accept_smoker: false,
  accept_alcoohol: true,
  residents_gender: :both,
  internet: false,
  furniture: :no_furniture,
  capacity: 2
)

StudentResidence.create!(
  name: 'Jurupinga',
  property_type: :apartment,
  accomodation_type: :fraternity,
  pet_friendly: true,
  lgbt_friendly: true,
  accept_smoker: true,
  accept_alcoohol: true,
  residents_gender: :female,
  internet: true,
  furniture: :complete,
  capacity: 5
)

