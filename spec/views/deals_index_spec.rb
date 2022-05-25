require 'rails_helper'

RSpec.describe 'Deal', type: :feature do
  describe 'Index' do
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

      @d1 = @u1.deals.new(id: 76, name: 'Check', amount: 15)
      @d1.save

      @d2 = @u1.deals.new(id: 75, name: 'Payment', amount: 30)
      @d2.save

      @gd1 = GroupDeal.new(deal_id: 76, group_id: 43)
      @gd2 = GroupDeal.new(deal_id: 75, group_id: 43)

      @gd1.save
      @gd2.save

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log In'
      click_on 'Entertaiment'
    end

    it 'shoud show the transactions page' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'should show the name of all my transactions' do
      expect(page).to have_content('Check')
      expect(page).to have_content('Payment')
    end

    it 'should show the total amount of each transaction' do
      expect(page).to have_content('$15.0')
      expect(page).to have_content('$30.0')
    end

    it 'should have a button to add transactions' do
      expect(page).to have_button('ADD TRANSACTION')
    end

    it 'should redirect to the add transaction page when clicking the add transaction button' do
      click_button 'ADD TRANSACTION'

      expect(page.current_path).to eq(new_group_deal_path(group_id: @g1.id))
    end

    it 'shoud be able to see the total amount of a category' do
      expect(page).to have_content('Total: $45.0')
    end
  end
end
