class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
  end

  def show
    @topping = Topping.find_by(id: topping_params[:id])
  end

  def create
    @topping = Topping.new(params[:topping])
    @topping.save
  end

  private

  def topping_params
    params.permit(:id, :name, :release_month, :category, :homemade, :course)
  end
end
