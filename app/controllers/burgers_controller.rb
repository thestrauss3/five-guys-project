class BurgersController < ApplicationController
  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
    @reviews = @burger.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @burger = Burger.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @burger = Burger.new(burger_params)
    @burger.restaurant = @restaurant
    if @burger.save
      flash[:notice] = "Burger submitted successfully!"
      redirect_to burger_path(@burger)
    else
      @errors = @burger.errors.full_messages
      render :new
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
