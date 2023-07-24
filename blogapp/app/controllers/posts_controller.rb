class PostsController < ApplicationController
  def show; end

  def index
    @user = User.where(id: params.require(:id))
    @posts = Post.where(author: params.require(:id))
  end
end
