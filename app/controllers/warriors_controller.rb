class WarriorsController < ApplicationController
  # GET /warriors/new
  def new
    @warrior = Warrior.new
  end

  # POST /warriors
  def create
    @warrior = Warrior.new(warrior_params)

    respond_to do |format|
      if @warrior.save
        format.html { redirect_to root_path, notice: 'Signup complete!' }
      else
        format.html { render :new }
      end
    end
  end

  private
    
  def warrior_params
    params.require(:warrior).permit(:name, :password, :password_confirmation)
  end
end
