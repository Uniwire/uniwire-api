# frozen_string_literal: true

puts 'Creating student residences...'

StudentResidence.create!(
  name: 'Rep Vegas',
  description: 'Quis voluptate aliqua incididunt ex velit commodo. Excepteur Lorem elit eiusmod ut velit sint cillum laboris pariatur. Adipisicing aute consectetur incididunt laborum exercitation ullamco sint occaecat amet sunt quis consectetur et. Veniam consequat exercitation exercitation reprehenderit amet veniam. Cupidatat occaecat esse aliquip id ex Lorem culpa cillum aliqua consectetur aliqua nulla in eiusmod.'
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
  description: 'Velit incididunt commodo exercitation et qui irure voluptate dolor occaecat. Pariatur excepteur fugiat enim pariatur eu voluptate laborum amet commodo labore magna occaecat commodo pariatur. Excepteur id labore laboris elit nisi. Exercitation aliqua amet cillum in cillum deserunt excepteur et laborum aliqua laborum excepteur. Sunt enim dolore labore officia tempor proident enim mollit non.',
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

