class AddPassedToSubmission < ActiveRecord::Migration[7.2]
  def change
    add_column :submissions, :passed, :boolean
  end
end
