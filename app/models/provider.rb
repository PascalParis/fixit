class Provider < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :service
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(service)
    if service
      where(service: service).order('id DESC')
    else
      order('id DESC')
    end
  end

end
