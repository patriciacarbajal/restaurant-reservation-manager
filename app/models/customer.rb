class Customer < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :name, length: {minimum: 2}
  validates :password,
    length: {in: 4..20, incorrect_pw_length: "password must be 4 to 20 characters"}

  has_many :reservations, dependent: :destroy
  has_many :restaurants, through: :reservations

end
