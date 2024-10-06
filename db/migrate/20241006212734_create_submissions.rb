class CreateSubmissions < ActiveRecord::Migration[7.2]
  def change
    create_table :submissions do |t|
      t.string :code
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
