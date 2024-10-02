class Task < ApplicationRecord
  has_rich_text :problem
  has_many :tests
  has_and_belongs_to_many :klasses
end
