require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      password: "Password",
      phone_number: 2,
      employment: "Employment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Employment/)
  end
end
