class DashboardController < ApplicationController
  before_action :ensure_student, except: [:index]
  before_action :ensure_admin, only: [:index_teacher]

  def index
    @classes = current_student.student.klasses

    respond_to do |format|
      format.html { render "dashboard/index" }
      format.json do
        classes_json = @classes
          .map {
            {
              identifier: _1.identifier,
              tasks: _1.tasks.map{ |t| {id: t.id.to_s, title: t.title, url: task_path(t)}}
            }
          }

        render json: {
          classes: classes_json
        }
      end
    end
  end

  def class_tasks
    @klass = Klass.find(params[:id])
  end

  def index_teacher
    ensure_admin
  end
end
