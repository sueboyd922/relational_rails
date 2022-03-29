class TeamsPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    if params[:alpha] == "yes"
      @players = @team.players.alphabetize
    else
      @players = @team.players
    end
  end
end
