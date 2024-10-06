class TaskStudentController < ApplicationController
  def show
    @task = Task.find(params[:task_id])
  end
end
