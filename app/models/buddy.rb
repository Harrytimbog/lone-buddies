class Buddy < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
  validates :name, :age, :description, presence: true
end
