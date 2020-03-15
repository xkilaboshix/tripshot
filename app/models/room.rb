class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy

  validates :name, presence: true, length: { in: 1..30 }

end
