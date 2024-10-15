class Correction < ApplicationRecord
  belongs_to :test
  belongs_to :submission
end
