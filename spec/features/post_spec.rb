describe 'Post Creation Process', type: :feature do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'Create a post' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit root_path
    fill_in 'post[content]', with: 'This is my first post and this is a test post.'
    click_button 'Save'
    expect(page).to have_content('This is my first post and this is a test post.')
  end

  it 'Empty posts returns an error' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit root_path
    fill_in 'post[content]', with: ''
    click_button 'Save'
    expect(page).to have_content('Post could not be saved. Content can\'t be blank')
  end
end
