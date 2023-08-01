require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(id: 1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 4,  email: "Tom@name.com", password: "112112")
  user2 = User.new(id: 2, name: 'Lilly', photo: 'Link', bio: 'bio', posts_counter: 0, email: "Lilly@name.com", password: "122122")
  post = Post.new(id: 1, author: user, title: 'Cars', text: 'text of first post', comments_counter: 1, likes_counter: 20)
  post2 = Post.new(id: 2, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post3 = Post.new(id: 3, author: user, title: 'Cars', text: 'text', comments_counter: 0, likes_counter: 20)
  post4 = Post.new(id: 4, author: user, title: 'Fourth post', text: 'text', comments_counter: 0, likes_counter: 20)
  comment = Comment.new(author: user2, post:post, text: 'text')
  comment1 = Comment.new(author: user, post:post, text: 'text')

  before(:all) do
    user.save
    user2.save
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

  describe 'Post view', type: :feature do
    describe 'post index', type: :feature do
      before { visit '/users/1/posts' }
      sleep(3)
      it 'shows that it has a pic' do
        expect(page).to have_css("img[src*='/assets/xpfs.jpg']")
      end
      it 'shows that it has username' do
        expect(page).to have_content('Tom')
      end
      it 'shows that it has number of posts' do
        expect(page).to have_content('Number of posts: 4')
      end
      it 'shows that it has post title' do
        expect(page).to have_content('Cars')
      end
      it 'shows that it has test of the post' do
        expect(page).to have_content('text of first post')
      end
      it 'shows that it has the comment and the name' do
        expect(page).to have_content('Lilly : text')
      end
      it 'shows that it has comment counter' do
        expect(page).to have_content('comment counter: 1')
      end
      it 'shows that it has likes counter' do
        expect(page).to have_content('likes counter:20')
      end

      it 'shows that it has show the content of the title' do
        click_link('POST#1')
        expect(page).to have_content('text of first post')
      end
      sleep(3)
      it 'shows that it has by the user name' do
        expect(page).to have_content('Tom')
      end
    end
  end
  describe 'post show', type: :feature do
    before { visit 'users/1/posts/1' }
    sleep(3)
    it 'shows that it has by the user name' do
      expect(page).to have_content('by Tom')
    end
    it 'shows that it has title of the post' do
      expect(page).to have_content('Cars')
    end
    it 'shows that it has the owner of the post' do
      expect(page).to have_content('Tom')
    end
    it 'shows that it has by the comment counter' do
      expect(page).to have_content('comment counter: 1')
    end
    it 'shows that it has by the Likes coutner' do
      expect(page).to have_content('likes counter:20')
    end
    it 'shows that it has by the content of the post' do
      expect(page).to have_content('text of first post')
    end
    it 'shows that it has by the comenters' do
      expect(page).to have_content('Lilly : text')
    end
    it 'shows that it has by the commenters' do
      expect(page).to have_content('Tom : text')
    end
  end
end
