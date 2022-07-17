require 'rails_helper'

RSpec.describe 'Employee modal', type: :system, js: true do
  let(:employees) { FactoryBot.create_list(:employee, 25) }

  before do
    employees
    visit root_path
  end

  it { expect(page).to have_css('div.grid', count: 25) }
  it expect(page).to have_button('Personal Data')
  it expect(page).to have_button('Employment')

  describe '#modal-form' do
    context 'when valid params' do
      it 'displays modal' do
        click_link('Personal Data')
        expect(page).to have_content('modal_content_here')
        fill_in('first_name', with: 'required', length: { maximum: 25 })
        fill_in('last_name', with: 'required', length: { maximum: 50 })
        fill_in('email', with: 'required@required.com')
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
    end

    context 'when invalid email' do
      it 'shows error mesagge' do
        expect(page).to have_button('Save', disabled: true)
        fill_in('First Name', with: 'twentysixcharactersherehehehheheheheheeh')
        expect to have_css('span.error').with_message('Max characters limit (25) surpassed')
      end
    end
  end
end
