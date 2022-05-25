require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'New' do
    before(:each) do
      User.destroy_all
      Group.destroy_all

      @u1 = User.new(name: 'Mary', password: '111111', email: 'u@u')
      @u1.save

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log In'
      click_button 'ADD CATEGORY'
    end

    it 'shoud show the add categories page' do
      expect(page).to have_content('ADD CATEGORY')
    end

    it 'shoud have a name input' do
      expect(assert_selector('input.group-name')).to eq(true)
    end

    it 'shoud have a icon input' do
      expect(assert_selector('input.group-icon')).to eq(true)
    end

    it 'shoud have sign up button' do
      expect(page).to have_button('Save')
    end

    it 'should create a category when credentials are correct' do
      fill_in 'Name', with: 'Dance'
      fill_in 'Icon URL', with: 'https://cdn1.iconfinder.com/data/icons/office-322/24/library-education-book-read-text-512.png'
      click_button 'Save'

      expect(page).to have_content('Dance')
    end
  end
end
