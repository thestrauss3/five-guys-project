class SearchesController < ApplicationController

  def index
    if params[:search]
      @burgers = Burger.search(params[:search])
      @restaurants = Restaurant.search(params[:search])
      if @burgers == [] && @restaurants == []
        @blank_message = "Searches have not resulted in any matches!"
      end
    end
  end

end
