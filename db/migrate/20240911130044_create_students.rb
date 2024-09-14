class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email
      t.string :identifier, null: false
      t.string :password_digest, null: false
      t.boolean :ask_new_password, null: false

      t.timestamps
    end

    add_index :students, :identifier, :unique => true
  end
end
