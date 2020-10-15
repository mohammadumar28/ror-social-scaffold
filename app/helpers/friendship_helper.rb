module FriendshipHelper
  def friend_inv(user)
    return unless user.id != current_user.id

    return if current_user.friends.include?(user)

    return unless !current_user.pending_friends.include?(user) && !user.pending_friends.include?(current_user)

    link_to('Send friendship invitation', user_friendships_url(user_id: current_user.id, friend_id: user),
            method: :post, class: 'btn btn-primary')
  end
end
