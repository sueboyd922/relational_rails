class PlayersController < ApplicationController
  def index
    @players = Player.active_players
  end

  def show
    @player = Player.find(params[:id])
    @team = Team.find(@player.team_id)
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

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to "/players"
  end

  private
    def players_params
      params.permit(:name, :position, :active, :points)
    end
end
