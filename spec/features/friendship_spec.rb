describe 'Friendship Process', type: :feature do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu@exam.com', password: '123456', password_confirmation: '123456')
    @friend = User.create(name: 'umar', email: 'umar1234@exam.com', password: '123456', password_confirmation: '123456')
  end

  it 'Send Friendship' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit "/users/#{@friend.id}"
    click_link('Send friendship invitation')
    click_on 'Sign out'

    fill_in 'user[email]', with: @friend.email
    fill_in 'user[password]', with: @friend.password
    click_button 'Log in'

    visit "/users/#{@friend.id}"
    click_link 'Accept'
    visit "/users/#{@friend.id}"
    expect(page).to have_content(@user.name)
  end
end
