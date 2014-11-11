require 'test_helper'

feature 'Wiki Site' do
  scenario 'Write a new recipe' do
    visit recipes_path
    click_on 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'
    click_on 'Sign up'

    click_on 'New Recipe'
    fill_in 'Title', with: 'Tomato Bisque'
    fill_in 'Step', with: 'Open a can of tomatoes and voilla!'
    click_on 'Create Recipe'
    page.text.must_include 'Recipe was successfully created.'
    page.text.must_include 'test@example.com'
  end
end
