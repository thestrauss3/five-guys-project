class RestaurantsController < ApplicationController

  def index
    @restaurants=  Restaurant.all
  end

  def show
    @restaurant= Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new()
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      @errors = @restaurant.errors.full_messages
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :dining_type, :description, :hours)
  end
end
