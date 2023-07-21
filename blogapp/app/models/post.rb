class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }

  def update_posts_counter(user)
    increment = user.posts_counter + 1
    user.update(posts_counter: increment)
  end

  def most_recent_post(comment)
    Post.where(id: comment.post_id)
  end
end
