class Api::V1::BurgersController < ApiController
  def show
    @burger = Burger.find(params[:id])
    render json: @burger
  end
  def index
    @burgers = Burger.all
    render json: @burgers
  end
end
