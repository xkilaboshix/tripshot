class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum achievement: [:旅見習い, :旅好き, :旅マスター, :果てなき冒険者]
  validates :name, presence: true
  
  # emailを保存する前に小文字に
  before_save { self.email = email.downcase }
  # emailバリデーション  フォーマットの検証、一意性、大文字でも小文字でも入力可能にし保存する前に小文字に
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}       
  
  has_many :favorites
  has_many :lists
  has_many :posts
  has_many :post_comments
  has_many :chats
  has_many :user_rooms
  
  # フォロー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :followers_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :followers_relationships, source: :user
  
  # 画像投稿用
  attachment :profile_image
  attachment :background_image

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
