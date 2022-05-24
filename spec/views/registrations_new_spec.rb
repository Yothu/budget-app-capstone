require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'Visiting the login page' do
    before(:each) do
      User.destroy_all

      visit new_user_registration_path
    end

    it 'shoud have a name input' do
      expect(assert_selector('input.registration-name')).to eq(true)
    end

    it 'shoud have an email input' do
      expect(assert_selector('input.registration-email')).to eq(true)
    end

    it 'shoud have a password input' do
      expect(assert_selector('input.registration-password')).to eq(true)
    end

    it 'shoud have a confirm password input' do
      expect(assert_selector('input.registration-conf-password')).to eq(true)
    end

    it 'shoud have sign up button' do
      expect(page).to have_button('Next')
    end

    it 'should create a user when credentials are correct' do
      fill_in 'Full name', with: 'Flor'
      fill_in 'Email', with: 'g@g'
      fill_in 'Password', with: '111111'
      fill_in 'Confirm Password', with: '111111'
      click_button 'Next'

      expect(page.current_path).to eq(user_path)
    end
  end
end
