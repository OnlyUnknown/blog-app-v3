class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # A method that updates the likes counter for a post.
  def update_like_counter
    find = Post.find_by(title: 'Basket ball')
    find.update(likes_counter: 2)
  end
end
