class RestaurantsController < ApplicationController

  def index
    @restaurants =  Restaurant.all
    @restaurants.order!(:name)
    @table_of_restaurants = []
    i = 0
    j = 2
     while j <= @restaurants.size + 1
       if j > @restaurants.size
         j = @restaurants.size
       end
       @table_of_restaurants << @restaurants[i..j]
       i += 3
       j += 3
     end
  end

  def show
    @restaurant= Restaurant.find(params[:id])
  end

  def new
    if current_user.present?
      @restaurant = Restaurant.new
    else
      flash[:error] = "Please log in before trying to submit a restaurant!"
      redirect_to new_user_session_path
    end
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
