class CreateKlassesTasksJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :klasses, :tasks do |t|
      t.index :klass_id
      t.index :task_id
    end
  end
end
