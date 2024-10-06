class DashboardController < ApplicationController
  def index
    ensure_student
  end

  def index_teacher
  ensure_admin
  end
end
