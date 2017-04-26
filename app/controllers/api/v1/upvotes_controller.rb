class Api::V1::UpvotesController < ApiController

  def show
    user= current_user
    review = Review.find(params[:id])
    uservotes = review.uservotes

    need_new_entry = true
    uservotes.each do |uservote|
      if uservote.user.id == user.id
        # binding.pry
        uservote.vote = uservote.vote + 1
        if uservote.vote == -1 || uservote.vote == 0
          uservote.save
        else
          flash[:error] = "You have already upvoted this post!"
        end
          need_new_entry = false
      end
    end

    if need_new_entry
      # binding.pry
       Uservote.create(vote: 1, user: user, review: review)
    end
    # binding.pry
    @total_votes = 0
    review.uservotes.each do |uservote|
      @total_votes += uservote.vote
    end
    # binding.pry
      render json: @total_votes
  end
end
