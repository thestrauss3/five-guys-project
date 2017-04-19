class ReviewsController < ApplicationController
  def index
  end
  def show
    @review = Review.find(params[:id])
  end
  def new
    @burger = Burger.find(params[:burger_id])
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.burger = Burger.find(params[:burger_id])
    if @review.save
      flash[:notice] = "Review submitted successfully!"
      redirect_to review_path(@review)
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
