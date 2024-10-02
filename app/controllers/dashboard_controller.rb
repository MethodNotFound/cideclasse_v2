class DashboardController < ApplicationController
  before_action :ensure_student

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
end
