class ReviewsController < ApplicationController
  def index
    @burger = Burger.find(params[:burger_id])
    @reviews = @burger.reviews
  end

  def new
    @burger = Burger.find(params[:burger_id])
    @burger_rating = params[:burger_rating]
    @body = params[:body]
    @review = Review.new(
      burger: @burger,
      burger_rating: @burger_rating,
      body: @body
    )
  end

  def create
    @burger = Burger.find(params[:burger_id])
    @review = Review.new(review_params)
    @review.burger = @burger
    if @review.save
      flash[:notice] = "Review submitted successfully!"
      redirect_to burger_path(@burger)
    else
      resubmit = { failed_submit: true }
      redirect_to new_burger_review_path(review_params.merge(resubmit))
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
