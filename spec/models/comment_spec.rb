require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    @post = @user.posts.build(content: 'hello, this a post for testing')
    @comment = @post.comments.build(user_id: @user.id, content: 'This is the best post ever!')
  end

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it 'returns comment in post' do
    expect(@post.comments.first).to eql(@comment)
  end
end
