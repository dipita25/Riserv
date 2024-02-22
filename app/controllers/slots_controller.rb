class SlotsController < ApplicationController

  def index
    @enterprise = Enterprise.where(user_id: current_user.id)
    @slots = Slot.where(enterprise_id: @enterprise[0].id)
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
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
    @user = @current_user
  end

  def update
    @slot = Slot.find(params[:id])
    if @slot.update(slot_params)
      redirect_to slots_path, notice: 'Slot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    if @slot.destroy
      redirect_to slots_path, status: :see_other
    else
      render :show, notice: 'the slot cannot be deleted cause it is linked to a reservation'
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:start_time, :end_time, :user_id, :status)
  end
end
