class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions do |t|
      t.boolean :active
      t.jsonb :metadata

      t.timestamps
    end
  end
end
