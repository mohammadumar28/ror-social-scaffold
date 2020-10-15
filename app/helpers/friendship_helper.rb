module FriendshipHelper
  def friend_inv(user)
    return unless user.id != current_user.id

    return if current_user.friends.include?(user)

    if !user.friend_requests.include?(current_user) && !current_user.friend_requests.include?(user)

      link_to('Send friendship invitation', user_friendships_url(user_id: current_user.id, friend_id: user),
              method: :post, class: 'btn btn-primary')
    elsif user.friend_requests.include?(current_user)
      content_tag(:p, 'Friend request already sent.')
    else
      content_tag(:p, 'Sent you an invitation')
    end
  end
end
