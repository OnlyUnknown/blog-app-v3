class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # A method that updates the comments counter for a post.
  def update_comment_counter
    find = Post.find_by(title: 'Basket ball')
    find.update(post_counter: '2')
  end
end
