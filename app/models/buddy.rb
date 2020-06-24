class Buddy < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, :price, :description, presence: true
end
