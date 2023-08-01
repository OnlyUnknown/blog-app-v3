require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(id:1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 4)
  user2 = User.new(id:2, name: 'Lilly', photo: 'Link', bio: 'bio', posts_counter: 0)
  post = Post.new(id: 1, author: user, title: 'Cars', text: 'text of first post', comments_counter: 1, likes_counter: 20)
  post2 = Post.new(id: 2, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post3 = Post.new(id: 3, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post4 = Post.new(id: 4, author: user, title: 'Fourth post', text: 'text', comments_counter: 0, likes_counter: 20)
  comment = Comment.new(author: user2, post:, text: 'text')
  comment1 = Comment.new(author: user, post:, text: 'text')


  before(:all) do
user2.save
 user.save 
 post.save 
 post2.save 
 post3.save 
 post4.save
 comment.save
 comment1.save
end

after(:all) do
  Post.destroy_all
  User.destroy_all
  Comment.destroy_all
end
  
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

  describe 'Post view', :type => :feature do
    describe 'post index' do
      before{visit "/users/1/posts"}
    scenario 'shows post and direction to them' do
      sleep(3)
      expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      expect(page).to have_content('Tom')
      expect(page).to have_content("Number of posts: 4")
      expect(page).to have_content("Cars")
      expect(page).to have_content("text of first post")
      expect(page).to have_content("Lilly : text")
      expect(page).to have_content("comment counter: 1")
      expect(page).to have_content("likes counter:20")
      click_link("POST#1")
      expect(page).to have_content("text of first post")
      sleep(3)
      expect(page).to have_content("Tom")
    end
  end

  describe 'post show' do
    before{visit "/users/1/posts/1"}
    scenario 'showing the specefied post' do
        sleep(3)
        expect(page).to have_content('by Tom')
        expect(page).to have_content("Cars")
      expect(page).to have_content('Tom')
      expect(page).to have_content("comment counter: 1")
      expect(page).to have_content("likes counter:20")
      expect(page).to have_content("text of first post")
      expect(page).to have_content("Lilly : text")
      expect(page).to have_content("Tom : text")
  end
end
