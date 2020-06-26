# frozen_literal_string: true

class Vacancy < ApplicationRecord
  self.inheritance_column = nil

  has_one :characteristic, dependent: :destroy
  has_many :pictures
  has_and_belongs_to_many :commodities, dependent: :destroy

  belongs_to :student_residence, inverse_of: :vacancies

  mount_uploader :image, PictureUploader

  enum gender: {
    both: 0,
    female: 1,
    male: 2
  }

  enum availability: {
    immediate: 0,
    soon: 1,
    unavailable: 2
  }

  enum type: {
    single_room: 0,
    shared_room: 1,
    entire_residence: 2
  }
end
