class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:id])
    @player = @team.players.create!(players_params)
    redirect_to "/teams/#{@team.id}/players"
  end

  private
    def players_params
      params.permit(:name, :position, :active, :points)
    end
end
