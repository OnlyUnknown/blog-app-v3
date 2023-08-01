require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(id:1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 3)
  user2 = User.new(id:2, name: 'Lilly', photo: 'Link', bio: 'bio', posts_counter: 0)
  post = Post.new(id: 1, author: user, title: 'Cars', text: 'text of first post', comments_counter: 0, likes_counter: 20)
  post2 = Post.new(id: 2, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post3 = Post.new(id: 3, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post4 = Post.new(id: 4, author: user, title: 'Fourth post', text: 'text', comments_counter: 0, likes_counter: 20)
  
  before(:all) do
user2.save
 user.save 
 post.save 
 post2.save 
 post3.save 
 post4.save
end

after(:all) do
  Post.destroy_all
  User.destroy_all
end

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
  it 'posts_counter should equal to 3' do
    expect(user.posts_counter).to equal(3)
  end


end
