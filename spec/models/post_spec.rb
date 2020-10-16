require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    @post = @user.posts.build(content: 'hello, this a post for testing')
  end

  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it 'returns post created by user' do
    expect(@user.posts.first).to eq(@post)
  end
end
