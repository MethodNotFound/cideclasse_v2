class Klass < ApplicationRecord
  has_and_belongs_to_many :students
  has_and_belongs_to_many :tasks
  has_many :reports
end
