class AttractionsController < ApplicationController
    def index
        if current_user
            @attractions = Attraction.all
            @user = User.find_by_id(current_user)
        else 
            redirect_to root_path
        end 
    end 

    def show
        if current_user
            @attraction = Attraction.find_by_id(params[:id])
            @user = User.find_by_id(current_user)
        else 
            redirect_to root_path
        end 
    end 

    def new
        if current_user
            @attraction = Attraction.new
        else 
            redirect_to root_path
        end 
    end 

    def create
        if current_user
            @attraction = Attraction.create(attraction_params)
            redirect_to attraction_path(@attraction.id)
        
        else 
            redirect_to root_path
        end 
    end 

    def edit
        if current_user
            @attraction = Attraction.find_by_id(params[:id])
            
            
        else 
            redirect_to root_path 
        end 
    end 


    def update
        if current_user
            @attraction = Attraction.find_by_id(params[:id])
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction.id)
        else 
            redirect_to root_path
        end 
    end 


    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end 

end
