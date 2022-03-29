class TeamsPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    if params[:alpha] == "yes"
      @players = @team.players.alphabetize
    elsif params[:points_over]
      # pts = params[:points_over].to_i
      @players = @team.players.points_over(params[:points_over])
    else
      @players = @team.players
    end
  end
end
