class CreateCorrections < ActiveRecord::Migration[7.2]
  def change
    create_table :corrections do |t|
      t.string :input
      t.string :output
      t.boolean :passed
      t.belongs_to :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
