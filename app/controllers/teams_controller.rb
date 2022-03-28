class TeamsController < ApplicationController
  def index
    @teams = Team.ordered_by_create
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
  end

  def create
    team = Team.create!(
      name: params[:name],
      winning_record: params[:winning_record],
      games_played: params[:games_played]
    )
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
  end
end
