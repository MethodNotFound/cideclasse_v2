class AddStudentReferenceToSessions < ActiveRecord::Migration[7.2]
  def change
    add_reference :sessions, :student, foreign_key: true
  end
end
