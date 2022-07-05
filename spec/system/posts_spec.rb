require 'rails_helper'

RSpec.describe 'Employee modal', type: :system, js: true do
  let(:employees) { create_list(:employees, 25)}

  before do
    employees
    visit root_path
  end

  describe 'form flow' do
    it 'has a card for each employee' do
      expect(page).to have_css(('.employee-card'), items: 25)
    end
    it '#user-form' do
      context 'when valid params' do
        click_link "Personal Data"
        expect(page).to have_content('a_modal_content_here')
        fill_in('First Name', with: 'ASDFASDFASD')
        fill_in('Last Name', with: 'ASDFASDFASDF')
        fill_in('Email', with: 'required@required.com')
        fill_in('Password', with: 'admin123,')
        fill_in('Phone Number', with: '55555555,')
        expect('#date-started').to match(number_regex_with_dashes)
        click_button('Next')
        expect('Employement').to be_enabled
        # Modal closes
        click_link 'Employment'
        fill_in('Employment', with: 'required, 25 character limit')
        fill_in('Date Started', with: 'required, 50 character limit')
        expect('#date-started').to match(date_regex)
        fill_in('Date Employment Ended', with: 'required')
        click_button('Save')
      end

      context 'when invalid email' do
        expect(page).to have_button('Save', disabled: true)
        fill_in('First Name', with: 'twentysixcharactersherehehehheheheheheeh')
        expect to have_css('span.error').with_message('Max characters limit (25) surpassed')
      end
    end
  end
end
