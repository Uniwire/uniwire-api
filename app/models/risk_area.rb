# frozen_string_literal: true

class RiskArea < ApplicationRecord
  self.inheritance_column = nil

  enum type: {
    flooding: 0,
    theft: 1,
    harassment: 2,
    other: 3
  }
end
