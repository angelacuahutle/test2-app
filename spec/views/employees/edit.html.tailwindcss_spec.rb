require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      password: "MyString",
      phone_number: 1,
      employment: "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[password]"

      assert_select "input[name=?]", "employee[phone_number]"

      assert_select "input[name=?]", "employee[employment]"
    end
  end
end
