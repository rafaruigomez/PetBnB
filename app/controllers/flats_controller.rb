class FlatsController < ApplicationController
  before_action :set_flat, only:[:show, :edit, :update, :destroy]
  def index
    # @flats = Flat.all
    @flats = policy_scope(Flat)
  end

  def show
    #@flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
  end

  def create

    @flat = Flat.new(flat_params)
     @user = current_user
     @flat.user = @user
    authorize @flat 

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    # if current_user != flat.user
    #   redirect_to edit_flat_path(@flat)
    # else
    # @flat = Flat.find(params[:id])

  end

  def update
    #@flat = Flat.find(params[:id])
    @flat.update(flat_params)
  end

  def destroy
    #@flat = Flat.find(params[:id])
    @flat.destroy
    # redirect_to flats_path(@flats_path)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end


  def flat_params
    params.require(:flat).permit(:name, :description, :location, :address, :price, photos: [])

  end
end
