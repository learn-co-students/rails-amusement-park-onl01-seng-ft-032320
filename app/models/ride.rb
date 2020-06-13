class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
 
    def take_ride
       return no_tickets_and_not_tall if no_tickets && not_tall
       return no_tickets if no_tickets
       return not_tall if not_tall
       
       user.tickets-= attraction.tickets
       user.nausea += attraction.nausea_rating
       user.happiness += attraction.happiness_rating
       user.save
       return "Thanks for riding the #{attraction.name}!"
    end
 
    def no_tickets
       if user.tickets < attraction.tickets
          "Sorry. You do not have enough tickets to ride the #{attraction.name}."
       end
    end
 
    def not_tall
       if user.height < attraction.min_height
          "Sorry. You are not tall enough to ride the #{attraction.name}."
       end
    end
 
    def no_tickets_and_not_tall
       "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the #{attraction.name}."
    end
 end