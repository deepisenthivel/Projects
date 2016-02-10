class Picture < ActiveRecord::Base
  belongs_to :Post
  has_attached_file :image,
:storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{image.original_filename}"}, :unique_filename => true
  }
validates_attachment_content_type :image,
  :content_type => [ "image/png", "image/jpeg", "image/gif", "application/pdf","application/ppt","application/pptx","application/vnd.ms-excel",
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword","application/zip",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain"]
validates_attachment :image,
  :size => { :in => 0..1000.megabytes }
end
