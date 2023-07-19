class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_posts_counter
    find = User.find_by(name: 'Tom')
    find.update(posts_counter: '2')
  end

  def self.most_recent_post(name)
    Post.limit(5).order(created_at: :desc).where(title: name)
  end
end

# first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
#    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

#    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
#    second_post = Post.create(author: first_user, title: 'Good afternon', text: 'This is my second post')
#    third_post = Post.create(author: first_user, title: 'Basket ball', text: 'This is my third post')
#    fourth_post = Post.create(author: second_user, title: 'Car accident', text: 'This is my fourth post')

#    first_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
#    second_comment = Comment.create(post: first_post, author: first_user, text: 'Hi Lily!' )
#    third_comment = Comment.create(post: second_post, author: second_user, text: 'Good after noon!' )
#    fourth_comment = Comment.create(post: third_post, author: second_user, text: 'First comment!' )
#    fifth_comment = Comment.create(post: third_post, author: second_user, text: 'Second comment!' )
#    sixth_comment = Comment.create(post: fourth_post, author: second_user, text: 'Hi Tom!' )
#    seventh_comment = Comment.create(post: fourth_post, author: second_user, text: 'Second comment!' )
