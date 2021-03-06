module FriendshipHelper
  def friend_inv(user)
    return unless user.id != current_user.id

    return if current_user.friends.include?(user)

    if !user.friend_requests.include?(current_user) && !current_user.friend_requests.include?(user)

      link_to('Send friendship invitation', user_friendships_url(user_id: current_user.id, friend_id: user),
              method: :post, class: 'btn btn-sm btn-info')
    elsif user.friend_requests.include?(current_user)
      content_tag(:div, 'Friend request already sent.', class: 'badge badge-info text-wrap')
    else
      content_tag(:div, 'Sent you an invitation', class: 'badge badge-warning text-wrap mr-2') +
        request_btn(user)
    end
  end
end
