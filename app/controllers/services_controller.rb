class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end
end
#   def show
#     # @service = Service.find(params[:id])
#   end

#   def new
#     @service = Service.new
#   end

#   def create
#     @service = Service.new(service_params)
#     @service.save
#     # No need for app/views/restaurants/create.html.erb
#     redirect_to service_path(@service)
#   end

#   def edit
#     # @service = Service.find(params[:id])
#   end

#   def update
#     # @service = Service.find(params[:id])
#     @service.update(service_params)
#     # No need for app/views/restaurants/update.html.erb
#     redirect_to service_path(@service)
#   end

#   def destroy
#     # @service = Service.find(params[:id])
#     @service.destroy
#     # No need for app/views/restaurants/destroy.html.erb
#     redirect_to services_path, status: :see_other
#   end

#   private

#   def service_params
#     params.require(:service).permit(:title, :description, :price)
#   end

#   def set_service
#     @service = Service.find(params[:id])
#   end

# end
