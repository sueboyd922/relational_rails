class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    @players = @team.players
    # @players = Team.find(params[:id]).players
    # require "pry"; binding.pry
  end
end
