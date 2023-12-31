class PostsController < ApplicationController
  def show
    @post = Post.where(id: params.require(:id))
    @user = User.all.where(id: params.require(:user_id))
  end

  def index
    @user = User.where(id: params.require(:user_id))
    @posts = Post.all.includes(:author).where(users: { id: params[:user_id] })
    @posts.each do |post|
      puts "#{post.title} was written by #{post.author.name}"
    end
  end

  def new
    @post = Post.new
    @post.author_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter, :author_id)
  end
end
