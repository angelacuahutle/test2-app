class Employee < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email,
  format: { with: /(.+)@(.+)/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 },
            presence: true
  validates :password, presence: true
# validates :phone_number,
# format: { with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/, message: "Enter valid phone" },
#           length: { maximum: 10 },
#           presence: true
end
