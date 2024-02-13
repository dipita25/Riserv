class SlotsController < ApplicationController

  def index
    return Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    raise
    @slot = Slot.new(slot_params)
    redirect_to slots_path
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to slots_path, status: :see_other
  end


  private

  def slot_params
    params.require(:slot).permit(:startTime, :endTime, :user_id, :status)
  end
end
