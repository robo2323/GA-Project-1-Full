# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :presets
  has_many :comments

  #encrypt password
  has_secure_password

  #Validations
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true, confirmation: true
end
