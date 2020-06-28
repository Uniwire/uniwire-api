# frozen_string_literal: true

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  def public_id
    "image-#{Rails.env}/#{model.class.name}/#{model.try(:name) || Time.now.strftime('%Y-%m-%d_%H-%M-%S')}"
  end
end
