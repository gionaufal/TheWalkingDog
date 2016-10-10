class ProposalsController < ApplicationController

  def index
    @walker = Walker.find(params[:walker_id])
    @proposals = Proposal.where(walker_id: @walker.id)
  end

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

  def approve
    proposal = Proposal.find_by(params[:walker_id], params[:id])
    proposal.approved!
    flash[:notice] = "Compromisso marcado para #{proposal.days}"
    redirect_to walker_proposals_path(params[:walker_id])
  end

  def refuse
    proposal = Proposal.find_by(params[:walker_id], params[:id])
    proposal.refused!
    flash[:notice] = 'A proposta foi recusada'
    redirect_to walker_proposals_path(params[:walker_id])
  end

  def rate
    proposal = Proposal.find(params[:id])
    proposal.rating = params[:rating]
    proposal.save
    redirect_to my_profile_path
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_id, :walker_id, :days, :hours,
                                     :dogs, :gang, :location, :observation)
  end
end
