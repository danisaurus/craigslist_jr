class Image < ActiveRecord::Base
  belongs_to :classified
  belongs_to :user
  mount_uploader :file, ImageUploader
end
