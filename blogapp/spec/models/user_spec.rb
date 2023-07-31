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

  describe 'User view', :type => :feature do
    
    describe 'index page' do
      before{visit "/users"}
    scenario 'shows all users name' do
      sleep(3)
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content("Number of posts: 3")
      expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      find('a[href="/users/1"]').click
      sleep(3)
      expect(page).to have_content("Tom")
    end
    end
    describe 'show page' do
      before{visit "/users/1"}
      it 'show the specefied user' do
      expect(page).to have_content("Tom")
      expect(page).to have_content("Number of posts: 3")
      expect(page).to have_content("bio")
      expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      expect(page).to_not have_content("Fourth post")
      expect(page).to have_content("see all posts")
      click_link('see all posts')
      expect(page).to have_content("Fourth post")
      visit "/users/1"
      click_link("POST#1")
      expect(page).to have_content("text of first post")
      end
    end

  end




end
