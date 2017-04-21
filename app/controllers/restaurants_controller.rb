class RestaurantsController < ApplicationController

  def index
    @restaurants=  Restaurant.all
  end

  def show
    @restaurant= Restaurant.find(params[:id])
  end

  def new
    @name = params[:name]
    @location = params[:location]
    @dining_type = params[:dining_type]
    @description = params[:description]
    @hours = params[:hours]
    @restaurant = Restaurant.new(
      name: @name,
      location: @location,
      dining_type: @dining_type,
      description: @description,
      hours: @hours
    )
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      resubmit = { failed_submit: true }
      redirect_to new_restaurant_path(restaurant_params.merge(resubmit))
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :dining_type, :description, :hours)
  end
end
