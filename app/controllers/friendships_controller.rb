class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.sent_friend_requests.build(friendship_params)
    if @friendship.save
      flash[:notice] = "Friend request sent"
    else
      flash[:alert] = "Friend request failed"
    end
    redirect_to root_path
  end

  def update
    @friendship = current_user.sent_friend_requests.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first
    @friendship = Friendship.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first if !@friendship
    if @friendship.save
      @friendship.update_attributes(accepted: true)
      current_user.add_friend(@friendship.sender)
      @friendship.sender.add_friend(current_user)
      current_user.delete_friend_request(@friendship)
      flash[:notice] = "Friend added"
    else
      flash[:alert] = "Cannot add friend"
    end
    redirect_to current_user
  end

  def destroy
    @friendship = Friendship.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first
    if @friendship.destroy
      flash[:notice] = "denied friend request"
    else
      flash[:alert] = "failed to destroy"
    end
    redirect_to current_user
  end

  private

  def friendship_params
    params.permit(:sender_id, :receiver_id)
  end
end
