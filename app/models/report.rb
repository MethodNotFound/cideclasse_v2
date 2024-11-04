class Report < ApplicationRecord
  belongs_to :klass

  has_one_attached :result
end
