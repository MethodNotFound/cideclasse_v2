class DashboardController < ApplicationController
  def index
    ensure_student
  end
end
