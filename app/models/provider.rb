class Provider < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :service
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :workorders

  def self.search(service, address)
    if service
      near(address).where(service_id: service).order('id DESC')
    else
      order('id DESC')
    end
  end

end
