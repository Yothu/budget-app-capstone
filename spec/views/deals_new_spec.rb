require 'rails_helper'

RSpec.describe 'Deal', type: :feature do
  describe 'New' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      Deal.destroy_all
      GroupDeal.destroy_all

      @u1 = User.new(name: 'Mary', password: '111111', email: 'u@u')
      @u1.save

      @g1 = @u1.groups.new(id: 43, name: 'Entertaiment',
                           icon: 'https://cdn3.iconfinder.com/data/icons/achievement-1/512/goal-success-achievement-20-512.png')
      @g1.save

      @g2 = @u1.groups.new(id: 44, name: 'Sport',
                           icon: 'https://cdn3.iconfinder.com/data/icons/achievement-1/512/goal-success-achievement-20-512.png')
      @g2.save

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log In'
      click_on 'Entertaiment'
      click_button 'ADD TRANSACTION'
    end

    it 'shoud show the add transactions page' do
      expect(page).to have_content('ADD TRANSACTION')
    end

    it 'shoud have a name input' do
      expect(assert_selector('input.deal-name')).to eq(true)
    end

    it 'shoud have a amount input' do
      expect(assert_selector('input.deal-amount')).to eq(true)
    end

    it 'shoud have a category to select' do
      expect(page).to have_content('Entertaiment')
      expect(page).to have_content('Sport')
    end

    it 'shoud have sign up button' do
      expect(page).to have_button('Save')
    end

    it 'should create a transaction when credentials are correct' do
      fill_in 'Name', with: 'Dance clases'
      fill_in 'Amount', with: '150'

      find(:css, "#groups_43[value='43']").set(true)
      find(:css, "#groups_44[value='44']").set(true)

      click_button 'Save'

      expect(page).to have_content('Dance clases')
    end
  end
end
