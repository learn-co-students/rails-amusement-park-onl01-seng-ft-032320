class AttractionsController < ApplicationController
    before_action :require_login

    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def new
        @attraction = Attraction.new
        @user = current_user
    end

    def create
        @attraction = Attraction.create(attraction_params)
        if @attraction.valid?
            redirect_to @attraction
        else
            render 'new'
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = current_user
        @ride = Ride.new
    end
    
    def edit
        @attraction = Attraction.find_by(id:params[:id])
        @user = current_user
    end

    def update
        @attraction = Attraction.find_by(id:params[:id])
        @attraction.update(attraction_params)
        if @attraction.valid?
            redirect_to @attraction
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
