require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_like_counter' do
    before do
      @post = Post.create!(title: 'Basket ball')
      @like = Like.create!(author: User.create!, post: @post)
    end

    it 'should update the likes counter for a post' do
      @like.update_like_counter
      expect(@post.likes_counter).to eq(2)
    end
  end
end