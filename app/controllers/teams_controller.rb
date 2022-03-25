class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(created_at: :desc)
    require "pry"; binding.pry
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
