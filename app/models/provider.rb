class Provider < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :service
end
