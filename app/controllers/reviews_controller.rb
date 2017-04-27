class ReviewsController < ApplicationController
  def index
    @burger = Burger.find(params[:burger_id])
    @reviews = @burger.reviews
  end

  def new
    if current_user.present?
      @burger = Burger.find(params[:burger_id])
      @review = Review.new
    else
      flash[:error] = "Please log in before trying to submit a review!"
      redirect_to new_user_session_path
    end
  end

  def create
    @burger = Burger.find(params[:burger_id])
    @review = Review.new(review_params)
    @review.burger = @burger
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review submitted successfully!"
      redirect_to burger_reviews_path(@burger)
    else
      @errors = @review.errors.full_messages
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
