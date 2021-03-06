# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  include Sprockets::Rails::Helper
  storage :fog
  include CarrierWave::MimeTypes
  process :set_content_type
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/#{model.created_at}"
  end

  resize_to_limit(600, 600)

  process :crop
  process :rotate 

  version :thumb do
    process :shrink
  end

  def filename
    @name ||= "#{timestamp}-#{super.gsub(/^[\d]{10}-/,'')}" if original_filename.present? and super.present?
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end

  def rotate
    manipulate! do |img|
      img.rotate!(model.rotation.to_i)
    end
    
  end

  def shrink
    manipulate! do |img|
      img.scale!(200, 200)
    end
  end

  def crop
    manipulate! do |img|
      x = model.crop_x.to_f*img.columns
      y = model.crop_y.to_f*img.rows
      w = model.crop_w.to_f*img.columns
      h = model.crop_h.to_f*img.rows
      img.crop!(x, y, w, h)
    end
  end
end
