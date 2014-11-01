require "test_helper"

feature 'Wiki Site' do
  scenario 'Write a new recipe' do
    sign_in
    visit root_path
    click_on 'New Recipe'

    fill_in 'Title', with: 'Tomato Bisque'
    click_on 'Create Recipe'
    page.text.must_have 'Recipe has been succesfully created.'
    page.text.must_include users(:Aliese).email
  end
end