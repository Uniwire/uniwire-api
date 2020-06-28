# frozen_string_literal: true

puts "\n== Creating image example =="

begin
  ImageExample.create!(
    name: 'house',
    image: File.open(File.join(Rails.root, 'db', 'seed', 'pictures', 'treehouse.jpg')),
  )

  green "\nImage example -> Created with success.\n"
rescue
  red "\nImage example  -> Error.\n"
end
