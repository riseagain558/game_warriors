class ApplicationController < ActionController::Base
  helper_method :current_warrior

  def current_warrior
    @current_warrior ||= Warrior.find_by(id: session[:warrior_id])
  end
end
