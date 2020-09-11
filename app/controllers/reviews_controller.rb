class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).all

  end
  def new
    @review = Review.new
    @flat = Flat.find(params[:flat_id])
    authorize @review
  end

  def create

    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat_id = @flat.id
    authorize @review
    if @review.save
      redirect_to flat_path(@flat)
    else
      render :new
    end

  end

  def destroyshow
  end

  def blank_stars
    5 - @flat.review.rating.to_i
    authorize @review
  end


   private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end

