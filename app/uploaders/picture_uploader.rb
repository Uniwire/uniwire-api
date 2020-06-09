# frozen_string_literal: true

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  def public_id
    return "image-#{Rails.env}/#{model.name}"
  end
end