class ReservationsController < ApplicationController

  def index
    @reservations = policy_scope(Reservation).includes(:flat)

    @guest_reservations = @reservations.where(user_id: current_user.id)
    @host_reservations = @reservations.where(flats: {user_id: current_user.id})
  end

  def show
     @reservation = Reservation.find_by(id: params[:id])
     authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path
    else
      redirect_to flat_path(@reservation.flat)
    end
  end


  def edit

    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @reservation = Reservation.where(id: params[:id])
    authorize @reservation
    @reservation.update(reservation_params)
    redirect_to reservations_path


  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(@reservation.user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:flat_id, :user_id, :status, :reservation_start, :reservation_end)
  end
end
