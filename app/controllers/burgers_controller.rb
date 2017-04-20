class BurgersController < ApplicationController
  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
  end

  def new
    @burger = Burger.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.restaurant = Restaurant.find(params[:restaurant_id])
    if @burger.save
      redirect_to burger_path(@burger)
    else
      flash[:error] = @burger.errors.full_messages.join(". \n")
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
