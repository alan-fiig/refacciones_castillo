class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      flash[:notice] = 'Product added!'
      redirect_to workers_path
    else
      flash[:error] = 'Failed to edit product!'
      render :new
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      flash[:notice] = 'Trabajador actualizado con éxito'
      redirect_to workers_path
    else
      flash[:error] = 'Error al actualizar trabajador'
      render :edit
    end
  end

  def destroy
    @worker = Worker.find(params[:id])

    if @worker.destroy
      flash[:notice] = 'Trabajador eliminado con éxito'
    else
      flash[:error] = 'Error al eliminar trabajador'
    end

    redirect_to workers_path
  end


  def worker_params
    params.require(:worker).permit(:name, :position, :salary, :age, :address, :telephone, :profile_picture)
  end


end
