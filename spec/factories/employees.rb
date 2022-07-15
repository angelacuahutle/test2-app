FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.name[1..25] }
    last_name { Faker::Name.last_name[1..50] }
    email { Faker::Internet.email }
    password { "admin123" }
    phone_number { "555-111-5555" } # TODO: 10 digits random number
    date_employment_started { Faker::Date.in_date_period }  # TODO: Copy from previous date time random
    employment { Faker::Job.title } 
    date_employment_ended { Faker::Date.in_date_period }  # TODO: Same as above
  end
end
