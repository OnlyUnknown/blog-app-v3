require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 5)
  post = Post.new(id: 1, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  before { user.save }
  before { post.save }
  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
    user.name = 'Tom'
  end

  it 'posts_counter should be integer' do
    user.posts_counter = 'asdf'
    expect(user).to_not be_valid
  end

  it 'posts_counter should be greater than or equal zero' do
    user.posts_counter = -1
    expect(user).to_not be_valid
    user.posts_counter = 5
  end

  it 'name should eq Tom' do
    expect(user.name).to eq('Tom')
  end

  it 'photo should eq to Link' do
    expect(user.photo).to eq('Link')
  end
  it 'bio should eq to bio' do
    expect(user.bio).to eq('bio')
  end
  it 'posts_counter should equal to 5' do
    expect(user.posts_counter).to equal(5)
  end
  it 'should return the most recent post for the given name' do
    expect(user.most_recent('Tom')).to eq('Cars')
  end
end
