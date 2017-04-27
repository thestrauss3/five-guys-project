class Api::V1::UservotesController < ApiController

  def index
    # @vote_count = Burger.params[:id].reviews
    # render json: @vote_count
  end

  def show
    burger = Burger.find(params[:id])
    @reviews=burger.reviews
    @reviews.each do |review|
      total_votes= review.total_vote_count
      review.review_rating = total_votes
      # binding.pry
      review.save
      # review.update_attribute(review_rating: total_votes)
    end
    render json: @reviews

    # @reviews = burger.reviews
    # @review_total_votes = []
    # @reviews.each do |review|
    #   @review_total_votes << [review.id, review.total_vote_count]
    # end
    # # binding.pry
    # render json: {:reviews => @reviews, :reviewTotalVotes => @review_total_votes}
  end



end
