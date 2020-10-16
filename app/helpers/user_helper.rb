module UserHelper
  def friend_request(user, friend_requests)
    return unless current_user == user

    content_tag(:h3, 'Friend Requests') +
      content_tag(:div) do
        friend_requests.uniq.each do |friend|
          concat(content_tag(:h4, friend.name, class: 'p-0 font-weight-light') +
                content_tag(:div, request_btn(friend), class: 'py-2'))
        end
      end
  end
end
