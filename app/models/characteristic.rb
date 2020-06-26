class Characteristic < ApplicationRecord
  belongs_to :vacancy

  enum furniture: {
    no_furniture: 0,
    complete: 1,
    incomplete: 2
  }
end
