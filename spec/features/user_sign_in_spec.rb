require 'rails_helper'

feature 'user signs in', %{
  As a user
  I want to be able to log into the app
  So I can create a survey

  Acceptance Criteria:

  - I should see a sign in form
  - If I fill it out without a valid sign in I should see an error
  - If I fill it out correctly I should be taken to the teacher survey
  } do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit root_path
    click_link 'Log In'
  end

  scenario 'an existing user specifies a valid email, username, and password' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Log Out')

  end

  scenario 'a nonexistant username and password is supplied' do
    fill_in 'Email', with: 'someone@whatev.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to_not have_content('Log Out')
  end

  scenario 'an existing email with the wrong password is denied access' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrect'
    click_button 'Log In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to_not have_content('Log Out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content('Log Out')
    expect(page).to_not have_content('Log In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end
end
