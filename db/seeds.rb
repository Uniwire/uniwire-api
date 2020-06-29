# frozen_string_literal: true

require 'yaml'

# Useful methods.

def image_file(file_name)
  File.open(File.join(Rails.root, 'db', 'seed', 'pictures', file_name))
end

def pick_element(file_name)
  path = Rails.root.join('db', 'seed', 'data', file_name + '.yml')
  YAML.load(File.read(path))
end

def red(string)
  puts "\033[31m#{string}\033[0m"
end

def green(string)
  puts "\033[0;32m#{string}\033[0m"
end

def yellow(string)
  puts "\033[0;33m#{string}\033[0m"
end

def pink(string)
  puts "\033[0;35m#{string}\033[0m"
end

# Cleaning old records.

puts "\n== Cleaning old records ==", ""

MODELS = [
  Vacancy,
  Commodity,
  StudentResidence,
  Characteristic,
  ImageExample
].freeze

MODELS.each do |model|
  begin
    model.destroy_all

    green "Clean records of #{model} -> Success."
  rescue
    red "Clean records of #{model} -> Error."
  end
end

# Summons individual seeds.

require_relative 'seed/student_residences_seed'
require_relative 'seed/vacancies_seed'
require_relative 'seed/commodities_seed'
require_relative 'seed/characteristics_seed'
require_relative 'seed/pictures'
