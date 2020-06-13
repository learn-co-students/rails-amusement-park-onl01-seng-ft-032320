class AttractionsController < ApplicationController 
  before_action :verified

  def index 
    @attractions = Attraction.all
  end 

  def show 
    @attraction = Attraction.find_by_id(params[:id])
  end 

  def new
    @attraction = Attraction.new
  end 

  def create 
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end 

  def edit 
    @attraction = Attraction.find_by_id(params[:id])
  end 

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end 

  def destroy
    @attraction = Attraction.find_by_id(params[:id])
    if current_user.admin
      @attraction.destroy 
    else
      redirect_to @attraction
    end 
  end 

  private 

  def attraction_params 
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end 

end 