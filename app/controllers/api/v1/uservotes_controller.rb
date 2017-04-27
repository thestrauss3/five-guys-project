class Api::V1::UservotesController < ApiController

  def index
    # @vote_count = Burger.params[:id].reviews
    # render json: @vote_count
  end

  def show
    burger = Burger.find(params[:id])
    @reviews = burger.reviews
    # @reviews.each do |review|
    #   review.uservotes .each do |uservotes|
    #     @totalVotes += uservotes
    #   end
    # end

    # binding.pry
    render json: @reviews
    # render json: {@reviews, @totalvotes}

  end



end
