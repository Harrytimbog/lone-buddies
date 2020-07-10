class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_buddies, foreign_key: :owner_id, class_name: "Buddy", dependent: :destroy
  has_one_attached :avatar


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
