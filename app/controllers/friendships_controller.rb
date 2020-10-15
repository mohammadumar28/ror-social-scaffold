class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id], confirmed: false)
    @friendship2 = Friendship.create(user_id: params[:friend_id], friend_id: params[:user_id])
    redirect_to root_path if @friendship.save
  end

  def update
    @friendship = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    @friendship2 = Friendship.where(user_id: current_user.id, friend_id: params[:user_id]).first
    @friendship.confirmed = 'true'
    @friendship2.confirmed = 'true'
    @friendship.save
    @friendship2.save
    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    @friendship2 = Friendship.where(user_id: current_user.id, friend_id: params[:user_id]).first
    @friendship.destroy
    @friendship2.destroy
    redirect_to root_path
  end
end
