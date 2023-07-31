class UsersController < ApplicationController
  def show
    @users = User.where(id: params.require(:id))
    @posts = Post.limit(3).where(author: params.require(:id))
  end

  def index
    @users = User.all
  end
end
