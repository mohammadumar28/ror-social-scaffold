module UserHelper


  def friend_request(user, friend_requests)
    return unless current_user == user
      content_tag(:h3, "Friend Requests") +
      content_tag(:div) do
        friend_requests.uniq.each do |friend|
          concat(content_tag(:p, friend.name) +
            link_to('Accept', user_friendship_path(friend.id), method: :patch, class: 'btn btn-success mr-2') +
            link_to('Reject', user_friendship_path(friend.id), method: :delete, class: 'btn btn-danger')
          )
        end
      end
  end

end