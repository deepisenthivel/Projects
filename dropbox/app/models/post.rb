class Post < ActiveRecord::Base
	has_many :pictures, :dependent => :destroy


# has_attached_file :attach,
# :storage => :dropbox,
# :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
# :dropbox_options => {
# :path => proc { |style| "#{style}/#{id}_#{attach.original_filename}"}, :unique_filename => true
#   }
# # has_attached_file :image,
# # :storage => :dropbox,
# # :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
# # :styles => { :medium => "300x300" , :thumb => "100x100>"},
# # :dropbox_options => {
# # :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"}, :unique_filename => true
# #   }
# # validates_attachment_content_type :image,
# #   :content_type => [ "image/png", "image/jpeg", "image/gif"]
# # validates_attachment :image,
# #   :size => { :in => 0..100.megabytes }
# validates_attachment_content_type :attach, :content_type => [ "application/pdf","application/ppt","application/pptx","application/vnd.ms-excel",
#              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
#              "application/msword","application/zip",
#              "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
#              "text/plain" ]

end
