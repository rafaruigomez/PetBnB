class ReservationsController < ApplicationController

  def index
    @reservations = policy_scope(Reservation).where(user_id: current_user.id)

  end

  def show
     @reservation = Reservation.find_by(id: params[:id])
     authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
    authorize @reservation
  end


  def edit
  end

  def update
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
