class Api::V1::UservotesController < ApiController

  def index
    # @vote_count = Burger.params[:id].reviews
    # render json: @vote_count
  end

  def show
    burger = Burger.find(params[:id])
    @reviews = burger.reviews

    # binding.pry
    render json: @reviews

  end

  def edit
  end

  def update
    binding.pry
    user= current_user
    review = Review.find(params[:id])
    uservotes = review.uservotes

    uservotes.each do |uservote|
    need_new_entry = 0
      if uservote.user.id == user.id
        uservote.vote + 1
        uservote.save
        need_new_entry = 1
      end

      if need_new_entry != 1
         Uservote.new(vote: 1, user: user, review: review)
      end
    end

      # render json of total votes to update the state

    # user.ratings
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
