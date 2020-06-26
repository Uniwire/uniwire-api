Commodity.destroy_all
StudentResidence.destroy_all

def image_file(file_name)
  File.open(File.join(Rails.root, 'db', 'seed_images', file_name))
end

require_relative 'seed/student_residences_seed'
require_relative 'seed/commodities_seed'
require_relative 'seed/vacancies_seed'
require_relative 'seed/pictures'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
