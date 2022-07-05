json.extract! employee, :id, :first_name, :last_name, :email, :password, :phone_number, :date_employment_started, :employment, :date_employment_ended, :created_at, :updated_at
json.url employee_url(employee, format: :json)
