class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :phone_number
      t.datetime :date_employment_started
      t.string :employment
      t.datetime :date_employment_ended

      t.timestamps
    end
  end
end
