require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  describe 'Visiting the splash screen' do
    before :each do
      visit unauthenticated_user_root_path
    end

    it 'should be in the spash screen' do
      expect(page.current_path).to eq('/')
    end

    it 'should have a login button' do
      expect(page).to have_button('LOG IN')
    end

    it 'should have a signup button' do
      expect(page).to have_button('SIGN UP')
    end

    it 'should redirect to login page if press the login button' do
      click_button 'LOG IN'
      expect(page.current_path).to eq(new_user_session_path)
    end

    it 'should redirect to signup page if press the signup button' do
      click_button 'SIGN UP'
      expect(page.current_path).to eq(new_user_registration_path)
    end
  end
end
