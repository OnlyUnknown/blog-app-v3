class PostsController < ApplicationController
  def show
  @post = Post.where(id: params.require(:id))
  @all = Post.all.where(id: params.require(:id))
  end

  def index
    @user = User.where(id: params.require(:user_id))
    @posts = Post.where(author: params.require(:user_id))
  end
end
