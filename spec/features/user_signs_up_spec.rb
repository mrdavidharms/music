require 'rails_helper'

feature 'user signs up', %{
As an User
I want to be able to register with the app
So I can create surveys

Acceptance Criteria:

- I should see a sign up form
- If I fill it out incorrectly I should see an error
- If I fill it out correctly I should be taken to the user root page
} do
  let(:user){ FactoryGirl.create(:user) }
  context "with email and password" do
    before do
      visit root_path
      click_link 'Sign Up'
    end

    scenario 'specify valid and required information' do

      fill_in 'Email', with: "user@email.com"
      fill_in "user_username", with: user.username
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'
      expect(page).to have_content("Welcome! You have signed up successfully.")

      expect(page).to have_content("Log Out")

    end

    scenario 'required information is not supplied' do
      click_button 'Sign up'

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content("Password can't be blank")

      expect(page).to_not have_content("Log Out")
    end

    scenario 'password confirmation does not match confirmation' do
      fill_in 'user_password', with: 'password'
      fill_in 'Password confirmation', with: 'somethingdifferent'

      click_button 'Sign up'
      expect(page).to have_content("doesn't match")
      expect(page).to_not have_content("Sign Out")
    end
  end
end
