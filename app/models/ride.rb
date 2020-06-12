class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction

    def take_ride 
        if too_short? || no_tickets?
            rejection = "Sorry."    
            rejection += " You do not have enough tickets to ride the #{attraction.name}." if no_tickets?
            rejection += " You are not tall enough to ride the #{attraction.name}." if too_short?
            rejection
        else 
            user.tickets -= attraction.tickets
            user.happiness += attraction.happiness_rating
            user.nausea += attraction.nausea_rating
            user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end 

    private 

    def too_short? 
        user.height< attraction.min_height
    end

    def no_tickets?
        user.tickets < attraction.tickets
    end
end