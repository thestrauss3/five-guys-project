class Api::V1::UpvotesController < ApiController

  def show
    user= current_user
    review = Review.find(params[:id])
    uservotes = review.uservotes
    need_new_entry = true
    uservotes.each do |uservote|
      if uservote.user.id == user.id
        if uservote.vote == -1 || uservote.vote == 0
          uservote.vote = uservote.vote + 1
          uservote.save
        end
          need_new_entry = false
      end
    end

    if need_new_entry
       Uservote.create(vote: 1, user: user, review: review)
    end

    @total_votes = 0
    review.uservotes.each do |uservote|
      @total_votes += uservote.vote
    end
    render json: @total_votes
  end
end
