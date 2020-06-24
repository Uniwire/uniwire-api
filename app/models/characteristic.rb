class Characteristic < ApplicationRecord
  belongs_to :vancancy

  enum furniture: {
    no_furniture: 0,
    complete: 1,
    incomplete: 2
  }
end
