# frozen_string_literal: true

# TODO: Remove this class and its migration.
# it exists only to demonstrate how to use
# cloudinary to upload images.
class ImageExample < ApplicationRecord
  mount_uploader :image, PictureUploader
end
