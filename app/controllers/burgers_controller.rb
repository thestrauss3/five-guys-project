class BurgersController < ApplicationController
  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
    @reviews = @burger.reviews
  end

  def new
    if current_user.present?
      @restaurant = Restaurant.find(params[:restaurant_id])
      @burger = Burger.new
    else
      flash[:error] = "Please log in before trying to submit a burger!"
      redirect_to new_user_session_path
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @burger = Burger.new(burger_params)
    @burger.restaurant = @restaurant
    @burger.user= current_user
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
