class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :input
      t.string :output
      t.boolean :hidden
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
