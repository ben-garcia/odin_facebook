class LikesController < ApplicationController
  def create
    like = current_user.likes.build(like_params)
    if like.save
      flash[:notice] = "You have liked the post"
    else
      flash[:alert] = "Failed to like post"
    end
    redirect_to current_user
  end

  def destroy
    like = Like.where(user_id: params[:user_id], post_id: params[:post_id]).first
    if like.destroy
      flash[:notice] = "Unliked post"
    else
      flash[:notice] = "Failed to unliked post"
    end
    redirect_to current_user
  end

  private

  def like_params
    params.permit(:post_id)
  end


end
