class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:my_profile]

  def my_profile
    @user = current_user
    render :show
  end

  def show
    @user = User.find(params[:id])
  end
end
