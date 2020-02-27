class Post < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :favorites
  has_many :post_comments

  attachment :image
  
  # お気に入りしてるか判断メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
