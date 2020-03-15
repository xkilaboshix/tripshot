class List < ApplicationRecord
  validates :title, presence: true, length: { in: 1..75 }
  validate :departure_date_cannot_be_greater_than_return_date
  validate :departure_date_return_date_present?
  belongs_to :user
  has_many :posts, dependent: :destroy

  # タグ数のバリデーション
  validates :tag_list, :length => {
    :maximum   => 3,
    :too_long  => "数が限界を超えました！　限界タグ数は%{count}です！"
  }
  
  # タグ機能の記述
  acts_as_taggable

  def departure_date_return_date_present?
    if (departure_date.present? && return_date.nil?) || (departure_date.nil? && return_date.present?)
      errors.add(:departure_date, "と帰宅日のうち片方だけの入力はできません") 
    end
  end

  def departure_date_cannot_be_greater_than_return_date
    if departure_date.present? && return_date.present? && return_date < departure_date
      errors.add(:departure_date, "は帰宅日より前に設定してください")
    end
  end
end
