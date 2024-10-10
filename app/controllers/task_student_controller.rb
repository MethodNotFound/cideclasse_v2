class TaskStudentController < ApplicationController
  def show
    @task = Task.find(params[:task_id])
    @student = current_student.student
  end
end
