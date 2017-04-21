class BurgersController < ApplicationController
  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
    @reviews = @burger.reviews
  end

  def new
    if !current_user.present?
      flash[:error] = "Please log in before trying to submit a burger!"
      redirect_to new_user_session_path
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      @name = params[:name]
      @price = params[:price]
      @description = params[:description]
      @image_url = params[:image_url]
      @burger = Burger.new(
        name: @name,
        price: @price,
        description: @description,
        image_url: @image_url,
        restaurant: @restaurant
      )
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @burger = Burger.new(burger_params)
    @burger.restaurant = @restaurant
    if @burger.save
      flash[:notice] = "Burger submitted successfully!"
      redirect_to burger_path(@burger)
    else
      resubmit = {failed_submit: true}
      redirect_to new_restaurant_burger_path(burger_params.merge(resubmit))
    end
  end

  private

  def burger_params
    params.require(:burger).permit(
      :name,
      :price,
      :description,
      :image_url
    )
  end
end
