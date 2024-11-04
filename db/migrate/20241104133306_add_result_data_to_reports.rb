class AddResultDataToReports < ActiveRecord::Migration[7.2]
  def change
    add_column :reports, :result_data, :text
  end
end
