require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldana@gmail.com')
    @post = Post.create(id: 1, user_id: 1, content: 'This a post for testing')
    @comment = Comment.create(id: 1, user_id: 1, post_id: 1, content: 'This is the best post ever!')
  end

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it 'returns comment in post' do
    expect(@post.comments.first).to eql(@comment)
  end
end
