class WalkersController < ApplicationController
  def show
    @walker = Walker.find(params[:id])
  end
end
