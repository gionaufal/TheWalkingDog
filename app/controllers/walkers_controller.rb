class WalkersController < ApplicationController
  def search
    @walkers = Walker.where(region: params[:region])
  end
end
