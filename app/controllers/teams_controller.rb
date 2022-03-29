class TeamsController < ApplicationController
  def index
    @teams = Team.ordered_by_create
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    team = Team.create!(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to '/teams'
  end

  private
    def team_params
      params.permit(:name, :games_played, :winning_record)
    end
end
