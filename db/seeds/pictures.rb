ImageExample.destroy_all

ImageExample.create!(
  name: 'house',
  image: File.open(File.join(Rails.root, 'db', 'seed_images', 'treehouse.jpg')),
)
