class CommentController < ApplicationController
  def new
    @comment = Comment.new
    @comment.author_id = current_user.id
    @cpost = params.require(:id)
  end

  def create
    @comment = Comment.new(post_params)
    @comment.save
  end

  private

  def post_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
