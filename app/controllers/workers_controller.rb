class WorkersController < ApplicationController
  before_action :set_worker, only: [:edit, :update, :destroy]

  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      flash[:notice] = 'Trabajador agregado con éxito'
      redirect_to workers_path
    else
      flash[:error] = 'Error al agregar trabajador'
      render :new
    end
  end

  def update
    if @worker.update(worker_params)
      flash[:notice] = 'Trabajador actualizado con éxito'
      redirect_to workers_path
    else
      flash[:error] = 'Error al actualizar trabajador'
      render :edit
    end
  end

  def destroy
    if @worker.destroy
      flash[:notice] = 'Trabajador eliminado con éxito'
    else
      flash[:error] = 'Error al eliminar trabajador'
    end

    redirect_to workers_path
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:name, :position, :salary, :age, :address, :telephone, :profile_picture)
  end

end
