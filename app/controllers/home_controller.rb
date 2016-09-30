class HomeController < ApplicationController
  def index
    @walkers = Walker.all
    @regions = Region::REGION
    flash[:alert] = 'Não temos nenhum walker cadastrado'
  end
end
