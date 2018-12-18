class HomeController < ApplicationController
  def index
    @online_warriors = Warrior.online
  end
end
