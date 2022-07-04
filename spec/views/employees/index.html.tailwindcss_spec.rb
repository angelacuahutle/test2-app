require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        password: "Password",
        phone_number: 2,
        employment: "Employment"
      ),
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        password: "Password",
        phone_number: 2,
        employment: "Employment"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Employment".to_s, count: 2
  end
end
