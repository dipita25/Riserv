class ReservationsController < ApplicationController
  def myself
    @enterprise_id = params[:enterprise_id]
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation_id = params[:id]
    @enterprise_id = params[:enterprise_id]
    @reservation = Reservation.find(params[:id])
    @slot = Slot.find(@reservation.slot_id)
    @service = Service.find(@reservation.service_id)
    @services = Service.all

    @enterprise = Enterprise.find(@enterprise_id)

    @key = ENV['MAPBOX_API_KEY']

  end


  def new
    raise
    @reservation = Reservation.new
    @user_id = current_user.id
  end

  def edit
    @enterprise_id = params[:enterprise_id].to_i
    @reservation = Reservation.find(params[:id].to_i)
    @service = Service.find(@reservation.service_id)
    @services = Service.where(enterprise_id: @enterprise_id)
    @slot = Slot.find(@reservation.slot_id)
    @slot = Slot.update(status: 0)
    @slots = Slot.where(enterprise_id: @enterprise_id, status: 0)
    @user = User.find(@reservation.user_id)

  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      @slot = Slot.find(@reservation.slot_id)
      @slot.update(status: 1)
      redirect_to myself_enterprise_reservations_path(params[:enterprise_id].to_i), notice: 'Réservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to myself_enterprise_reservations_path(params[:enterprise_id].to_i), notice: 'the reservation has been deleted'
    else
      render :show, notice: 'something went wrong'
    end
  end

  def reserver
    @reservation = Reservation.new
    @reservation.service_id = params[:service_id]
    @reservation.slot_id = params[:slot_id]
    @reservation.user_id = current_user.id
    @reservation.status = true
    if @reservation.save
      @slot = Slot.find(@reservation.slot_id)
      @slot.update(status: 1)
      redirect_to users_reservations_path, notice: 'reservation has been successfully created'
    else
      render :myself, notice: 'something went wrong'
    end
  end

  def my_reservations
    @reservations = Reservation.where(user_id: current_user.id)

  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :service_id, :slot_id)
  end

  def new_reservation_params
    params.require(:reservation).permit(:user_id, :service_id, :slot_id)
  end
end
