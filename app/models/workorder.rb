class Workorder < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  validates :date, presence: true
end
