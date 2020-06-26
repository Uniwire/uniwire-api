# frozen_string_literal: true

puts 'Creating characteristic'

characteristic = Characteristic.new(
  vacancy_id: Vacancy.first.id,
  air_conditioning: true,
  furnished: 2,
  include_cleaner: true
)

characteristic.vacancy = Vacancy.first
characteristic.save
