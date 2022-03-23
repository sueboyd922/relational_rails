class PlayersController < ApplicationController
  def index
    @players = Player.all
    require "pry"; binding.pry
  end
end
