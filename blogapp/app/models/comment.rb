class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # A method that updates the comments counter for a post.
  def update_comment_counter(post)
    increment = post.comments_counter + 1
  post.update(comments_counter: increment)
  end
end
