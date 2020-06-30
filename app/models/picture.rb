class Picture < ApplicationRecord
  belongs_to :vacancy
  belongs_to :student_residence

  mount_uploader :image, UploaderFactory.uploader
end
