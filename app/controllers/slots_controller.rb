class SlotsController < ApplicationController

  def index
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      raise
      redirect_to slots(@slot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    raise
    @slot = Slot.find(params[:id])
    if @slot.update(slot_params)
      redirect_to slots_path, notice: 'Slot was successfully updated.'
    else
      render :edit
    end
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
