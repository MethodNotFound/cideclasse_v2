class Student < ApplicationRecord
  # include ActiveModel::SecurePassword
  # attr_accessor :password_digest
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_and_belongs_to_many :klasses
end
