class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # A method that updates the likes counter for a post.
  def update_like_counter
    post = Post.find_by(id: post_id)
    increment = post.likes_counter + 1
    post.likes_counter = increment
    post.save
  end
end
