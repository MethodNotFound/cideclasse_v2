class TaskStudentController < ApplicationController
  def show
    @sidebar = true
    @task = Task.find(params[:task_id])
    @student = current_student.student

    ##################33

    @sidebar = true
    @submission = Submission.new
    @task = Task.find(params[:task_id])
    @submission.task = @task

    @previous_submissions = @task.submissions.where(student: current_student.student)

    @inspected = Submission.find(params[:inspect]) if params[:inspect]
  end
end
