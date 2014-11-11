require 'test_helper'

feature 'I should be able to' do

  scenario 'Sign Up' do
    visit recipes_path
    click_on 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'
    click_on 'Sign up'

    page.text.must_include 'You have signed up successfully.'
  end
end

feature 'I should be able to' do

  scenario 'Sign Out' do
    visit recipes_path
    click_on 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'
    click_on 'Sign up'
    click_on 'Sign out'
    page.text.must_include 'Signed out successfully.'
  end
end
