class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id], confirmed: false)
    redirect_to root_path if @friendship.save
  end

  def update
    @friendship = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    @friendship.confirm_friend
    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    @friendship.destroy
    redirect_to root_path
  end
end
