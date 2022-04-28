require 'rails_helper'

RSpec.describe 'Food Index', type: :feature do
  describe 'Food' do
    before(:each) do
      @user1 = User.create! name: 'Grace', password: '888888', email: 'test@test.com',
                            confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '888888'
      click_button 'Log in'
      visit root_path
    end

    it 'shows confirmation that user is logged in' do
      expect(page).to have_content('Logged in as test@test.com.')
    end

    it 'has button to add new food' do
      expect(page).to have_selector(:link_or_button, 'Add Food')
    end

    it 'has a table for foods' do
      expect(page).to have_content('Food')
    end
  end
end
