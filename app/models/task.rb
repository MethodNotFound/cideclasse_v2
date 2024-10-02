class Task < ApplicationRecord
  has_rich_text :problem
  has_many :tests
  has_and_belongs_to_many :klasses

  accepts_nested_attributes_for :tests, reject_if: :all_blank, allow_destroy: true
end
