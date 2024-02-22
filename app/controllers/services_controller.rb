class ServicesController < ApplicationController

  def index
    @enterprise = Enterprise.where(user_id: current_user.id)
    @services = Service.where(enterprise_id: @enterprise[0].id)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    raise
    @service = Service.new(service_params)
    if @service.save
      redirect_to services(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def service_params
    params.require(:service).permit(:user_id, :title, :description, :price)
  end
end
