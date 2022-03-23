class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    # require "pry"; binding.pry
    @team = Team.find(params[:id])
  end
end
