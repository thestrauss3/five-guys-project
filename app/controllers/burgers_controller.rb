class BurgersController < ApplicationController
  def index
    @burgers = Burger.all
  end
  def show

  end
  def new

  end
  def create
  end
end
