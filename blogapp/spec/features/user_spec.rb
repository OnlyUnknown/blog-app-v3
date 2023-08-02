require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(id: 1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 3)
  user2 = User.new(id: 2, name: 'Lilly', photo: 'Link', bio: 'bio', posts_counter: 0)
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

  describe 'User view', type: :feature do
    describe 'index page', type: :feature do
      before { visit '/users' }
      sleep(3)
      it 'shows that it has the username' do
        expect(page).to have_content('Tom')
      end
      it 'shows that it has the username' do
        expect(page).to have_content('Lilly')
      end
      it 'shows that it has by Number of posts' do
        expect(page).to have_content('Number of posts: 3')
      end
      it 'shows that it has by the profile pic' do
        expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      end
      it 'shows that it direct you to the person page' do
        find('a[href="/users/1"]').click
        sleep(3)
        expect(page).to have_content('Tom')
      end
    end
    describe 'show page', type: :feature do
      before { visit '/users/1' }
      it 'show the specefied user' do
        expect(page).to have_content('Tom')
      end
      it 'show the specefied user nuumber of posts' do
        expect(page).to have_content('Number of posts: 3')
      end
      it 'show the specefied user bio' do
        expect(page).to have_content('bio')
      end
      it 'show the specefied user porfile pic' do
        expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      end
      it 'show the specefied user does not show the fourth post' do
        expect(page).to_not have_content('Fourth post')
      end
      it 'show the specefied user it has see all posts' do
        expect(page).to have_content('see all posts')
      end
      it 'show the specefied user all posts' do
        click_link('see all posts')
        expect(page).to have_content('Fourth post')
      end
      it 'show the specefied user posts can be clicked' do
        visit '/users/1'
        click_link('POST#1')
        expect(page).to have_content('text of first post')
      end
    end
  end
end
