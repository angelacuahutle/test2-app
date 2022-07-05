require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      password: "MyString",
      phone_number: 1,
      employment: "MyString"
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[password]"

      assert_select "input[name=?]", "employee[phone_number]"

      assert_select "input[name=?]", "employee[employment]"
    end
  end
end
