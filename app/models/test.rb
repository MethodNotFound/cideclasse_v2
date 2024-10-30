class Test < ApplicationRecord
  belongs_to :task
  has_many :corrections, dependent: :destroy
end
