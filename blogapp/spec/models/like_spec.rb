require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(id: 1, name:"Tom", photo:"Link", bio:"bio", posts_counter: 0)
  post =  Post.new(id:1, author: user, title:"Cars", text:"text", comments_counter:0, likes_counter: 20)
  comment = Comment.new(author: user, post: post, text:"comment text")
  before {post.save}
  before {user.save}
  before{comment.save}

    it 'should update the comments_counter of the post' do
      comment.update_comment_counter(post)
      expect(post.comments_counter).to eq(1)
    end

end
