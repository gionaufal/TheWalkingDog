class HomeController < ApplicationController
  def index
    @walkers = Walker.all
    @regions = Region::REGION
  end
end
