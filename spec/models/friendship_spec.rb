require 'rails_helper'

RSpec.describe Friendship, type: :model do

  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com')
    @user2 = User.create(id: 2, name: 'Umar', email: 'umar@gmail.com')
    @friend = Friendship.create(user_id: 1, friend_id: 2, confirmed: true)
  end 
  
  it 'returns confirmed friend' do
    expect(@user.friends.first).to eq(@user2)
  end
end
