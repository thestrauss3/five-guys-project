class Api::V1::UservotesController < ApiController

  def index
    # @vote_count = Burger.params[:id].reviews
    # render json: @vote_count
  end

  def show
    burger= Burger.find(params[:id])
    @reviews= burger.reviews

    # binding.pry
    render json: @reviews

  end

  def edit
  end

  def update

    # if user.uservote.vote >=1 or <=-1 do
    #   nothing
    # else
    #   do somthing
    # end

    # if user.uservote.vote = 1
    #   button downvote
    # elsif user.uservote.vote = 0
    #   button downvote || button upvote
    # elsif user.uservote.vote = -1
    #   button upvote
    # end

  end

end
