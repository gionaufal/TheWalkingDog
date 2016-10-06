class ProposalsController < ApplicationController
  def new
    @walker = Walker.find(params[:walker_id])
    @proposal = Proposal.new
    @user = current_user
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @walker = Walker.find(params[:walker_id])
    @proposal.walker_id = @walker.id
    @proposal.user_id = current_user.id
    if @proposal.save
      flash[:notice] = 'Proposta enviada! Aguarde a resposta.'
      redirect_to root_path
    else

      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_id, :walker_id, :datetime,
                                     :dogs, :gang, :observation)
  end
end
