class Picture < ApplicationRecord
  belongs_to :vacancy, :student_residence

  mount_uploader :image, UploaderFactory.uploader
end
