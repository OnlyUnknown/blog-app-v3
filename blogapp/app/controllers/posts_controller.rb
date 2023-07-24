class PostsController < ApplicationController
  def show
    
  end

  def index
    @posts = Post.where(author: params.require(:id))
  end
end
