class ReviewsController < ApplicationController
  # def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # @reviews = @restaurant.reviews
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successsfully created!🎉'
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
