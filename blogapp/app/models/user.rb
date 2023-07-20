class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :posts_counter, numericality: { only_integer: true }
  def self.most_recent(input)
    User.limit(3).order(created_at: :desc).where(name: input)
  end
# Name must not be blank.
# PostsCounter must be an integer greater than or equal to zero.

end
