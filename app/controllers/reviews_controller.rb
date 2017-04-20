class ReviewsController < ApplicationController
  def index
    @burger = Burger.find(params[:burger_id])
    @reviews = @burger.reviews
  end

  def new
    @burger = Burger.find(params[:burger_id])
    @review = Review.new
  end

  def create
    @burger = Burger.find(params[:burger_id])
    @review = Review.new(review_params)
    @review.burger = @burger
    if @review.save
      flash[:notice] = "Review submitted successfully!"
      redirect_to burger_path(@burger)
    else
      flash[:error] = @review.errors.full_messages.join(". \n")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :burger_rating,
      :body
    )
  end
end
