class Api::V1::UservotesController < ApiController

  def index
  end

  def show
    burger = Burger.find(params[:id])
    @reviews=burger.reviews
    @reviews.each do |review|
      total_votes= review.total_vote_count
      review.review_rating = total_votes
      review.save
    end
    @reviews = @reviews.order(review_rating: :desc)
    render json: @reviews
  end
end
