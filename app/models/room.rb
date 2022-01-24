class Room < ApplicationRecord
  belongs_to :user
  attachment :room_image
  has_many :bookings, dependent: :destroy 

  validates :room_name, presence: true
  validates :room_introduction, presence: true
	validates :room_introduction, length: {maximum: 30}
	validates :address, presence: true
	validates :price, numericality: true
	validates :room_image, presence: true

end
