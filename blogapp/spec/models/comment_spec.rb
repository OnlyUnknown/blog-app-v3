require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(id: 1, name:"Tom", photo:"Link", bio:"bio", posts_counter: 0)
  post =  Post.new(id:1, author: user, title:"Cars", text:"text", comments_counter:0, likes_counter: 0)
  comment = Comment.new(author: user, post: post, text:"comment text")
  like = Like.new(author: user, post: post)
  before {post.save}
  before {user.save}
  before{comment.save}
  before{like.save}
    it 'should update the likes_counter of the post' do
      like.update_like_counter(post)
      expect(post.likes_counter).to eq(1)
    end

end
