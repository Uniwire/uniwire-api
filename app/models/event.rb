# frozen_string_literal: true

class Event < ApplicationRecord
  self.inheritance_column = nil

  validates :title, presence: true
end
