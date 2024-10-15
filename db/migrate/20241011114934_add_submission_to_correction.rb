class AddSubmissionToCorrection < ActiveRecord::Migration[7.2]
  def change
    add_reference :corrections, :submission, null: true, foreign_key: true
  end
end
