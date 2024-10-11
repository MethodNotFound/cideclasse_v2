class FixCorrection < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :corrections, :submissions

    # Remove the old column
    remove_column :corrections, :submission_id

    # Add the new column
    add_column :corrections, :test_id, :integer

    # Add the new foreign key
    add_foreign_key :corrections, :tests, column: :test_id
  end
end
