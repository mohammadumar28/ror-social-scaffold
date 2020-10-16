module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def request_btn(user)
    link_to('Accept', user_friendship_path(user, user.id), method: :patch, class: 'btn btn-success btn-sm mr-2') +
      link_to('Reject', user_friendship_path(user, user.id), method: :delete, class: 'btn btn-danger btn-sm')
  end
end
