class RacesController < ApplicationController

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.create(race_params)
    redirect_to races_path
  end


  private

  def race_params
    params.permit(:name, :location, :length)
  end

end
