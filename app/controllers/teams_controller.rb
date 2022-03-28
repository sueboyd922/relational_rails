class TeamsController < ApplicationController
  def index
    @teams = Team.ordered_by_create
  end

  def show
    # require "pry"; binding.pry
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
  end
end
