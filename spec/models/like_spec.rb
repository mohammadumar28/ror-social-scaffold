require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'aldu', email: 'aldu123@mail.com', password: '123456', password_confirmation: '123456')
    @post = Post.create(user_id: @user.id, content: 'hello, this a post for testing')
    @like = Like.create(post_id: @post.id, user_id: @user.id)
  end

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it 'returns like count in post' do
    expect(@post.likes.count).to eql(1)
  end
end
