class Report < ApplicationRecord
  belongs_to :klass

  include ResultUploader::Attachment(:result) # adds an `image` virtual attribute
end
