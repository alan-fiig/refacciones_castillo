class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.order(Arel.sql("CASE WHEN status = 'Finished' THEN 0 ELSE 1 END"))
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(worker_params)
    if @client.save
      flash[:success] = 'Cliente agregado con éxito'
      redirect_to clients_path
    else
      flash[:error] = 'Error al agregar cliente'
      render :new
    end
  end

  def update
    if @client.update(worker_params)
      flash[:info] = 'Cliente actualizado con éxito'
      redirect_to clients_path
    else
      flash[:error] = 'Error al actualizar cliente'
      render :edit
    end
  end

  def destroy
    if @client.destroy
      flash[:info] = 'Cliente eliminado con éxito'
    else
      flash[:error] = 'Error al eliminar cliente'
    end

    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def worker_params
    params.require(:client).permit(:name, :work_description, :status, :initial_payment, :total_pay, :telephone, :address, :start_date, :end_date)
  end

end
