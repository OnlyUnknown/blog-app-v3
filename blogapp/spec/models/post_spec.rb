require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(id: 1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 0)
  post = Post.new(author: user, title: 'Cars', text: 'text', comments_counter: 3, likes_counter: 20)
  comment = Comment.new(author: user, post:, text: 'text')
  before { post.save }
  before { user.save }
  it 'title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title should be less than 250 length' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'comments_counter should be integer' do
    post.comments_counter = 'asdf'
    expect(post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'liks_counter should be integer' do
    post.likes_counter = 'asdf'
    expect(post).to_not be_valid
  end

  it 'likes_counter should be greater than or equal zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  describe 'method' do
    it 'should update the posts_counter of the user' do
      post.update_posts_counter(user)
      expect(user.posts_counter).to eq(1)
    end
    it 'should retrun the name of the most recent' do
      view = post.most_recent_post(comment)
      expect(view).to eq('Cars')
    end
  end
end
