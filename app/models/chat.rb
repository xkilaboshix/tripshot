class Chat < ApplicationRecord
  validates :message, length: { in: 1..140 }

  belongs_to :user
  belongs_to :room
end
