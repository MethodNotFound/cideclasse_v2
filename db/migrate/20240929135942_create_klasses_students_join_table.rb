class CreateKlassesStudentsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :klasses, :students do |t|
      t.index :klass_id
      t.index :student_id
    end
  end
end
