# test2-app

# The excersise consist on creating a single page application 

![Screenshot](shoot-app.png)


# LANGUEGES, FRAMEWORKS AND DATABASES

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


# HOW TO SET UP THE REPOSITORY TO RUN THE APP 
   `git clone git@github.com:angelacuahutle/test2-app.git`

  `.bin/dev`


# ROADMAP

- [x] Install mysql
- [x] Add Tailwind
- [x] Install and setup rails rspec
- [x] Write Capybara test
- [x] Generate teacher model using scaffold
- [x] Trobleshoot capybara test
  No errors allowed
  Failures allowed!
- [x] Write controller
- [x] Views
- [x] Finishes and tailwind design 
- [x] Deploy 

## CRITERIA AND REQUIREMENTS

The excersise consist on building a single page application implementing the following criteria:
  On entry, it shows the following buttons:
      [x] Personal Data
      [x] Employment
  Clicking on Personal Data, will cause a Modal to appear, displaying the following entry fields:
      [x]First Name – required, 25 character limit
      [x]Last Name – required, 50 characters limit
      [x]Nickname – not required
      [x]Email Address - required
      [x]Phone Number - required
  The model will have Save & Cancel buttons
      [x]Email field validation must be done dynamically, as the user enters it, cannot proceed to the
      next field until this is filled and validated 
      [x]Error will appear below the field if any
      [x]Phone number validation must be done dynamically and needs to be in the form xxx-xxx-xxxx
      So, if the user enters 5551115555, as they’re entering it, it will be displayed as 555-111-5555
      [x]When the form is saved, it automatically goes into the second form: Employment. This will also
      be a modal. It will have the following fields:
          - Employer - required
          - Date Started - required
      [x]Date Employment Ended - required
      [x]Date fields requirements: calendar widget as well as manual input with field validation and
      automatic insertion of separators (MM/DD/YYYY)
      [x]There will be an “Add Employment” button. When clicked, a new set of employment fields are added.
      [x]The Save button will be grayed out, until all the required fields are filled.
      

When you’re done with the exercise, please share your GitHub repo and a Readme explaining
what needs to be done to make the application run.