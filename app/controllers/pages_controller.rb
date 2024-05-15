class PagesController < ApplicationController
  def login
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Inicio de sesión exitoso"
    else
      flash.now[:alert] = "Usuario o contraseña incorrectos"
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sesión cerrada"
  end

  def dashboard
  end

  def pay
  end
end
