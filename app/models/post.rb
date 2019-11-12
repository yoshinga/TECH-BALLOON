class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user

  def self.search(search)
    return Post.all() unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end
end
