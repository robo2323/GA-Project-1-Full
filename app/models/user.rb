class User < ApplicationRecord
  has_many :presets
  has_many :comments

  #encrypt password
  has_secure_password

  #Validations
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true, confirmation: true
end