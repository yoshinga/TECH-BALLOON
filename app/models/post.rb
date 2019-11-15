class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :favorites, foreign_key: 'post_id', dependent: :destroy
  has_many :users, through: :favorites

  def self.search(search)
    return Post.all() unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end
end
