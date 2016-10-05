class ProposalController < ApplicationController
  def new
    @proposal = Proposal.new
  end
end
