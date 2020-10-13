require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldana@gmail.com')
    @post = Post.create(id: 1, user_id: 1, content: 'This a post for testing')
    @like = Like.create(id: 1, user_id: 1, post_id: 1)
  end

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it 'returns like count in post' do
    expect(@post.likes.count).to eql(1)
  end
end
