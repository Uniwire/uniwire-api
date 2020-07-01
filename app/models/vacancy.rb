# frozen_literal_string: true

class Vacancy < ApplicationRecord
  self.inheritance_column = nil

  include AASM

  has_one :characteristic, dependent: :destroy
  has_many :pictures
  has_and_belongs_to_many :commodities, dependent: :delete_all

  belongs_to :student_residence, inverse_of: :vacancies

  mount_uploader :image, UploaderFactory.uploader

  enum gender: {
    both: 0,
    female: 1,
    male: 2
  }

  enum availability: {
    available: 0,
    available_soon: 1,
    unavailable: 2
  }

  enum type: {
    single_room: 0,
    shared_room: 1,
    entire_residence: 2
  }

  aasm column: :availability, enum: true do
    state :available
    state :available_soon
    state :unavailable

    event :vacate_soon do
      transitions from: %i[unavailable available], to: :available_soon
    end

    event :vacate_now do
      transitions from: %i[unavailable available_soon], to: :available
    end

    event :occupy do
      transitions from: %i[available available_soon], to: :unavailable
    end
  end
end
