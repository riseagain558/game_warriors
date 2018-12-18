class SessionsController < ApplicationController
  def new
  end

  def create
    warrior = Warrior.find_by(name: params[:name])
    if warrior && warrior.authenticate(params[:password])
      session[:warrior_id] = warrior.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Name or password is invalid!"
      render :new
    end
  end

  def destroy
    session[:warrior_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
