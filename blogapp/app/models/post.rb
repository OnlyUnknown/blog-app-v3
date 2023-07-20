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

  def self.update_posts_counter
    find = User.find_by(name: 'Tom')
    find.update(posts_counter: '2')
  end

  def self.most_recent_post(name)
    Post.limit(5).order(created_at: :desc).where(title: name)
  end
end
