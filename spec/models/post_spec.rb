require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com')
    @post = Post.create(id: 1, user_id: 1, content: 'hello, this a post for testing')
  end

  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it 'returns post created by user' do
    expect(@user.posts.first).to eq(@post)
  end
end
