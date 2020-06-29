# frozen_string_literal: true

class UploaderFactory
  def self.uploader
    if ENV['UPLOAD_TO_THE_CLOUD'] == 'true'
      PictureUploader
    else
      LocalUploader
    end
  end
end
