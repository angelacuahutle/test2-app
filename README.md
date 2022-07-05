# README

### The excersise consist on creating a single page application

![Screenshot](shoot-app.png)

### LANGUEGES, FRAMEWORKS AND DATABASES

1. Rails 7
2. SLIM
3. Hotwire
4. Stimulus
5. TurboFrames
6. Tailwind
7. MySQL
8. RSpec
9. Faker
10. Capybara

### HOW TO SET UP THE REPOSITORY TO RUN THE APP

Follow these steps to run:

```sh
git clone git@github.com:angelacuahutle/test2-app.git
cd test2-app.git
cp config/example/application.yml .application.yml
rails db:migrate db:seed
bundle install
.bin/dev
```

To run tests,

```sh
rspec
```

### ROADMAP

- [x] Install mysql
- [x] Add Tailwind
- [x] Install and setup rails rspec
- [x] Write Capybara test
- [x] Generate teacher model using scaffold
- [x] Trobleshoot capybara test
      No errors allowed
      Failures allowed!
- [ ] Views
- [ ] Finishes and tailwind design
- [ ] Deploy

#### CRITERIA AND REQUIREMENTS

The excersise consist on building a single page application implementing the following criteria:
On entry, it shows the following buttons:
- [] Personal Data
- [] Employment

Clicking on Personal Data, will cause a **Modal** to appear, displaying the following entry fields:
  - [ ]First Name – **required**, 25 character limit
  - [ ]Last Name – **required**, 50 characters limit
  - [ ]Nickname – **not required**
  - [ ]Email Address - **required**
  - [ ]Phone Number - **required**
The model will have Save & Cancel buttons
- [ ]Email field validation must be done **dynamically**, as the user enters it, cannot proceed to the
  next field until this is filled and validated
- [ ]Error will appear below the field if any
- [ ]Phone number validation must be done **dynamically** and needs to be in the form xxx-xxx-xxxx
  So, if the user enters 5551115555, as they’re entering it, it will **be displayed as 555-111-5555**
- [ ]When the form is saved, it automatically goes into the second form: Employment. This will also
  be a **modal**. It will have the following fields: 
  - Employer - **required** 
  - Date Started - **required**
  - Date Employment Ended - **required**
- [ ]Date fields requirements: **calendar widget** as well as manual input with field validation and 
  **automatic insertion of separators** (MM/DD/YYYY)
- [ ]There will be an “Add Employment” button. When clicked, a new set of employment fields are added.
- [ ]The Save button will be **grayed out, until all the required fields** are filled.

When you’re done with the exercise, please share your GitHub repo and a Readme explaining
what needs to be done to make the application run.

## TEST DRAFT

Unit

- Model Employee
  @employee = Employee.all
  validates :email, password, phone number, presence: true, uniqueness: true
  'Last Name', with: 'required, 50 character limit'
  'First Name', with: 'required, 25 character limit'
- Controller action
  employees#index
- System
  visit root_path # employee#index
  expect to have multiple cards for each employee
  within '#user-form'
    context 'when valid params'
      click_link "Personal Data"
      expect(page).to have_content('a_modal_content_here')
      fill_in('First Name', with: 'required, 25 character limit')
      fill_in('Last Name', with: 'required, 50 character limit')
      fill_in('Email', with: 'required')'
      fill_in('Password', with: 'required,')
      fill_in('Phone Number', with: 'required,')
      expect('#date-started').to match(number_regex_with_dashes)
      click_button('Next')
      expect('Employement').to be_enabled
      # Modal closes
      click_link 'Employment'
      fill_in('Employment', with: 'required, 25 character limit')
      fill_in('Date Started', with: 'required, 50 character limit')
      expect('#date-started').to match(date_regex)
      fill_in('Date Employment Ended', with: 'required')
      click_button('Save')    context 'when invalid personal data'
    context 'when invalid email'
      expect(page).to have_button('Save', disabled: true)
      fill_in('First Name', with: 'required, 25 character limit')
      expect to find css ('span.error') with_message 'Max characters limit (25) surpassed'


