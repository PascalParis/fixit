class Workorder < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  validates :booking_date, presence: true
end
