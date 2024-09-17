class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def ensure_admin
    if admin? == false
      redirect_to new_session_path
    end
  end

  def ensure_student
    if current_student.nil?
      redirect_to new_session_path
    end
  end

  def admin?
    session[:current_session_id] == "admin"
  end

  def current_student
    Session.find_by_id(session[:current_session_id])
  end
end
