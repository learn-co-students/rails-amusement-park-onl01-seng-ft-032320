class AttractionsController < ApplicationController 
    before_action :set_attraction, only: [:show, :edit, :update]
    
    def index
        @attractions = Attraction.all
    end

    def show 
    end

    def new 
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to @attraction
        else 
            redirect_to attraction_new_path
        end
    end

    def edit 
    end

    def update 
        @attraction.update(attraction_params)
        redirect_to @attraction
    end 

    private

    def set_attraction
        @attraction = Attraction.find_by_id(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :min_height, :tickets)
    end
end