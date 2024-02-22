class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end


  def new
    raise
    @reservation = Reservation.new
    @user_id = current_user.id
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @service = Service.find(@reservation.service_id)
    @services = Service.where(user_id: @reservation.user_id)
    @slot = Slot.find(@reservation.slot_id)
    puts @slot
    @slots = Slot.where(user_id: @slot.id)
    @user = User.find(@reservation.user_id)
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      raise
      redirect_to @reservation
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path, status: :see_other
    else
      render :show, notice: 'the reservation has been deleted'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :service_id, :slot_id)
  end

  def new_reservation_params
    params.require(:reservation).permit(:user_id, :service_id, :slot_id)
  end
end
