class FlatsController < ApplicationController
  before_action :set_flat, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @flats = Flat.all
    return @flats = policy_scope(Flat).where(location: params[:location].capitalize) if params[:location]

    @flats = policy_scope(Flat)
  end

  def owned
    # @flats = Flat.all
    # @flats = policy_scope(Flat)
    @owned_flats = current_user.owned_flats
    authorize @owned_flats
  end

  def booked
    # @flats = Flat.all
    # @flats = policy_scope(Flat)
    @booked_flats = current_user.booked_flats
    authorize @booked_flats
  end

  def show
    #@flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create

    @flat = Flat.new(flat_params)
    @user = current_user
    @flat.user = @user
    authorize @flat 
    
    if @flat.save
      # redirect_to flat_path(@flat)
      redirect_to owned_flats_path
    else
      render :new
    end
  end

  def edit
    # if current_user != flat.user
    #   redirect_to edit_flat_path(@flat)
    # else
    # @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update
    #@flat = Flat.find(params[:id])
    @flat.update(flat_params)
    authorize @flat
    redirect_to flat_path(@flat)
  end

  def destroy
    #@flat = Flat.find(params[:id])
    @flat.destroy
    authorize @flat
    redirect_to owned_flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end


  def flat_params
    params.require(:flat).permit(:name, :description, :location, :address, :price, photos: [])

  end
end
