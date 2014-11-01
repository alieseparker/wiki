require "test_helper"

feature "I should be able to" do
  scenario 'users/sign_up' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'
    click_on 'Sign Up'

    page.must_have_content 'Welcome! You have signed up successfully'
    page.wont_have_content 'There was a problem with your sign up'
  end

  scenario 'Sign In' do
    visit 'users/sign_in'
    fill_in 'Email', with: 'aliese@you.com'
    fill_in 'Password', with: 'asdfasdf'
    click_on 'Sign In'

    page.must_have_content 'You have signed in successfully.'
  end

  scenario 'Sign Out' do
    visit 'users/sign_in'
    fill_in 'Email', with: 'aliese@you.com'
    fill_in 'Password', with: 'asdfasdf'
    click_on 'Log In'
    page.must_have_content 'Signed in successfully'
    click_on 'Sign Out'
    page.must_have_content 'Signed out successfully'
  end
end