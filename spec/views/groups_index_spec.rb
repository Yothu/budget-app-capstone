require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all

      @u1 = User.new(name: 'Mary', password: '111111', email: 'u@u')
      @u2 = User.new(name: 'Ilanda', password: '123123', email: 'u@i')

      @u1.save
      @u2.save

      @r1 = @u1.groups.new(name: 'Entertaiment',
                           icon: 'https://cdn3.iconfinder.com/data/icons/achievement-1/512/goal-success-achievement-20-512.png',
                           total_amount: 123)

      @r2 = @u1.groups.new(name: 'Education',
                           icon: 'https://cdn1.iconfinder.com/data/icons/office-322/24/library-education-book-read-text-512.png',
                           total_amount: 431)

      @r1.save
      @r2.save

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log In'
    end

    it 'shoud show the categories page' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should show the name of all my categories' do
      expect(page).to have_content('Entertaiment')
      expect(page).to have_content('Education')
    end

    it 'should show the total amount of each category' do
      expect(page).to have_content('$123.0')
      expect(page).to have_content('$431.0')
    end

    it 'should have a button to add categories' do
      expect(page).to have_button('ADD CATEGORY')
    end

    it 'should redirect to the add category page when clicking the add categories button' do
      click_button 'ADD CATEGORY'

      expect(page.current_path).to eq(new_group_path)
    end

    it 'shoud redirect to the transactions page when clicking a category' do
      click_on 'Entertaiment'
      expect(page.current_path).to eq(group_deals_path(@r1))
    end
  end
end
