class Post < ApplicationRecord
  belongs_to :list
  has_many :favorites
  has_many :post_comments
end
