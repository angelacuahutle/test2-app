FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    phone_number { 1 }
    date_employment_started { "2022-07-03 22:22:41" }
    employment { "MyString" }
    date_employment_ended { "2022-07-03 22:22:41" }
  end
end
