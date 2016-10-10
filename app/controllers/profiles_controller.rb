class ProfilesController < ApplicationController
  before_action :authenticate_walker!, only: [:show, :edit_walker]
  before_action :authenticate_user!, only: [:my_profile]

  def my_profile
    @user = current_user
    @proposals = Proposal.where(user_id: current_user.id)
    render :show
  end

  def show
    @user = User.find(params[:id])
  end
end
