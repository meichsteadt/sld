require 'rails_helper'

describe 'goes through the sign_up and sign_in processes' do
  it 'signs up a user' do
    visit root_path
    click_link 'Sign-up'
    fill_in 'user[email]', :with => 'email@test.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'
  end
  it 'signs a user in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign-in'
    fill_in 'user[email]', :with => 'test1234@test.com'
    fill_in 'user[password]', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Sign out'
  end
end
