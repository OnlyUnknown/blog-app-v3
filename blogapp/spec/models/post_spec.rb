require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(id: 1, name: 'Tom', photo: 'Link', bio: 'bio', posts_counter: 0)
  subject { Post.new(author: user, title: 'Cars', text: 'text', comments_counter: 3, likes_counter: 20) }
  before { subject.save }
  before { user.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 250 length' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 'asdf'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'liks_counter should be integer' do
    subject.likes_counter = 'asdf'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe 'method' do
    it 'should update the posts_counter of the user' do
      subject.update_posts_counter(user)
      expect(user.posts_counter).to eq(1)
    end
  end
end
