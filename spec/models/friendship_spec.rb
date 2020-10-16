require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user = User.create(name: 'aldiii', email: 'aldu5678@mail.com', password: '123456', password_confirmation: '123456')
    @user2 = User.create(name: 'umar', email: 'umar@mail.com', password: '123456', password_confirmation: '123456')
    @friend = Friendship.create(user_id: @user.id, friend_id: @user2.id, confirmed: true)
    @friend2 = Friendship.create(user_id: @user.id, friend_id: @user2.id, confirmed: false)
  end

  it { should belong_to(:user) }
  it { should belong_to(:friend) }

  it 'returns confirmed friend' do
    expect(@user.friends.first).to eq(@user2)
  end

  it 'returns pending friends' do
    expect(@user2.friend_requests.first).to eq(@user)
  end
end
