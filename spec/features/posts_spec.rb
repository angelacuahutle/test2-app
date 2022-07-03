require 'rails_helper'
RSpec.describe Post, driver: :selenium_chrome, js: true do
  describe 'the create posts process' do
    it 'should create a post' do
      visit new_post_path

      fill_in 'Title', with: 'Post title'
      fill_in 'Content', with: 'Post content'

      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
    end
  end
end
