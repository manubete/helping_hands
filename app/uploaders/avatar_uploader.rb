# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process :convert => 'png'
  process :tags => ['post_picture']
  process :resize_to_limit => [800, 600]

  version :standard do
    process :resize_to_limit => [800, 600]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

end
