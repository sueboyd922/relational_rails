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

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(players_params)
    redirect_to "/players/#{@player.id}"
  end

  private
    def players_params
      params.permit(:name, :position, :active, :points)
    end
end
