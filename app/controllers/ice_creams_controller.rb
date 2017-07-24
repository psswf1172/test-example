class IceCreamsController < ApplicationController
  def index
    @ice_creams = IceCream.all

    respond_to do |format|
      format.html
      format.csv { send_data @ice_creams.to_csv }
    end
  end

  def show
    @ice_cream = IceCream.find_by(id: ice_cream_params[:id])
  end

  private

  def ice_cream_params
    params.permit(:id, :name, :release_start, :release_end, :categories, :servings, :course)
  end
end