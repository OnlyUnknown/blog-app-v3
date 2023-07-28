class LikeController < ApplicationController
  def new
    @like = Like.new
    @like.author_id = current_user.id
  end

  def create
    @like = Like.new(like_params)
    @like.save
    @like.update_like_counter
  end
  private

  def like_params
    params.require(:like).permit(:author_id, :post_id,)
  end

end
