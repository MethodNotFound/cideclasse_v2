class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.belongs_to :klass, null: false, foreign_key: true
      t.boolean :finished

      t.timestamps
    end
  end
end
