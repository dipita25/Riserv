class ServicesController < ApplicationController

  def index
    @enterprise = Enterprise.find(params[:enterprise_id])
    @services = Service.where(enterprise_id: @enterprise.id)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @enterprise = Enterprise.find(params[:enterprise_id])
    @enterprise_id = params[:enterprise_id]
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @enterprise_id = params[:enterprise_id]
    if @service.save
      redirect_to enterprise_services_path(@enterprise_id), notice: 'service created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      redirect_to enterprise_services_path(@service.enterprise_id), notice: 'service deleted successfully'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @service = Service.find(params[:id])
    @enterprise_id = params[:enterprise_id]
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to enterprise_services_path(@service.enterprise_id), notice: 'service updated successfully'
    else
      render :edit
    end
  end

  def my_services
    @enterprise_id = params[:enterprise_id].to_i
    @services = Service.where(enterprise_id: @enterprise_id)
  end


  private
  def service_params
    params.require(:service).permit(:enterprise_id, :title, :description, :price, :photo)
  end
end
