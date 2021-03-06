class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  before_action :require_login

  def render_404
    respond_to do |format|
      format.json { head :not_found }
    end
  end
end
