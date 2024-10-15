class Submission < ApplicationRecord
  belongs_to :task
  belongs_to :student
  has_many :corrections
end
