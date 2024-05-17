class PagesController < ApplicationController
  def login
    redirect_to dashboard_path if current_user
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, flash: { info: 'Inicio de sesión exitoso.' }
    else
      redirect_to root_path, flash: { error: 'Error al ingresar el usuario o la contraseña.' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { info: 'Sesión cerrada correctamente.' }
  end

  def dashboard
    @workers = Worker.count
    @clients_left = Client.where(status: "Process").count
    @clients_finished = Client.where(status: "Finished").count

  end

  def expenses
    @profits = Client.sum(:total_pay)
    @payments = Worker.sum(:salary)
  end
end
