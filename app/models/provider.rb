class Provider < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :service
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :service_id, presence: true
end
