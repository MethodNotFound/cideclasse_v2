class Student < ApplicationRecord
  # include ActiveModel::SecurePassword
  # attr_accessor :password_digest
  has_secure_password
  has_many :sessions
end
