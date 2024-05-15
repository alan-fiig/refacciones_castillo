class ApplicationController < ActionController::Base
  before_action :require_login, except: [:login, :create]

  private

  def require_login
    unless current_user
      flash[:error] = "Debes iniciar sesión para acceder a esta página"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
