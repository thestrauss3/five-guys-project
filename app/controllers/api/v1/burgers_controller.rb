class Api::V1::BurgersController < ApiController

  def show
    @burger = Burger.all.sample
    render json: @burger
  end

  def index
    @burgers = Burger.all.order(:name)
    first_half = @burgers.size / 2 - 1
    second_half = @burgers.size / 2
    @first_column_of_burgers = @burgers[0..first_half]
    @second_column_of_burgers = @burgers[second_half..-1]

    render json:
      {
        :burgersFirstHalf =>@first_column_of_burgers,
        :burgersSecondHalf => @second_column_of_burgers
      }
  end
end
