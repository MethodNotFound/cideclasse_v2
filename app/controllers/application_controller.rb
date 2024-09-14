class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def ensure_admin = nil
  def ensure_student = nil

  def current_session
    Session.find_by(id: session[:current_session_id])
  end
end
