# frozen_string_literal: true

class Establishment < ApplicationRecord
  self.inheritance_column = nil

  validates :name, presence: true

  enum establishment_type: {
    food: 0,
    home_appliances: 1,
    weaving: 2,
    building_supplies: 3,
    departament_store: 4,
    others: 5
  }
end
