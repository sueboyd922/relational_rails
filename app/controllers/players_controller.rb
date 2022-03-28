class PlayersController < ApplicationController
  def index
    @players = Player.all
    # require "pry"; binding.pry
  end

  def show
    @player = Player.find(params[:id])
  end
end
