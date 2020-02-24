class List < ApplicationRecord
  validates :title, presence: true, length: { in: 1..75 }
  validate :departure_date_cannot_be_greater_than_return_date
  belongs_to :user
  has_many :posts
  
  # タグ機能の記述
  acts_as_taggable

  def departure_date_cannot_be_greater_than_return_date
    if departure_date.present? && return_date.present? && return_date < departure_date
      errors.add("出発日を帰宅日より前に設定してください")
    end
  end
end
