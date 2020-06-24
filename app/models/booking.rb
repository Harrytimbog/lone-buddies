class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
  validates :start_on, :end_on, presence: true
end
