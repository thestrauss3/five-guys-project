class SearchesController < ApplicationController

  def index
    if params[:search] == ""
      @blank_message = "You have submitted a empty query"
    else
      @burgers = Burger.search(params[:search])
      @restaurants = Restaurant.search(params[:search])
      if @burgers == [] && @restaurants == []
        @blank_message = "Searches have not resulted in any matches!"
      end
    end
  end

end
