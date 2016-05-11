require 'rails_helper'

feature 'User sign in' do

  given(:user) { create(:user) }

  scenario 'Registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@test2.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
  
end
