class TaskStudentController < ApplicationController
  def show
    @sidebar = true
    @task = Task.find(params[:task_id])
    @student = current_student.student
  end
end
