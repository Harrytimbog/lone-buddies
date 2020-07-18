class Buddy < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
  validates :name, :age, :description, :photo, :category, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
