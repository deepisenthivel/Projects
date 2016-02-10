class Post < ActiveRecord::Base
has_attached_file :attach,
:storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{attach.original_filename}"}, :unique_filename => true
  }
has_attached_file :image,
:storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
:styles => { :medium => "300x300" , :thumb => "100x100>"},
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{image.original_filename}"}, :unique_filename => true
  }
validates_attachment :image, :presence => true,
  :content_type => { :content_type => "image/png" },
  :size => { :in => 0..100.kilobytes }
validates_attachment_content_type :attach, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

end
