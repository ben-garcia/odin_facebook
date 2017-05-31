class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      flash[:notice] = "Comment Posted"
    else
      flash[:alert] = "Failed to post comment" 
    end
    redirect_to current_user
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    if comment.destroy
      flash[:notice] = "deleted comment"
    else
      flash[:alert] = "cannot delete comment"
    end
    redirect_to current_user
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
