class WalkersController < ApplicationController
  def show
    @walker = Walker.find(params[:id])
  end

  def search
    @walkers = Walker.where(region: params[:region])
    @regions = Region::REGION
    @region = params[:region]
  end
end
