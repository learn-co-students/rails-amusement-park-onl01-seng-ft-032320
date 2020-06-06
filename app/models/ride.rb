class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        short_tickets = "You do not have enough tickets to ride the #{self.attraction.name}."
        short_height = "You are not tall enough to ride the #{self.attraction.name}."
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            "Sorry. #{short_tickets} #{short_height}"
        elsif self.user.tickets < self.attraction.tickets
           "Sorry. #{short_tickets}"
        elsif self.user.height < self.attraction.min_height
            "Sorry. #{short_height}"
        else
            self.user.update(tickets: user.tickets - attraction.tickets)
            self.user.update(happiness: user.happiness + attraction.happiness_rating)
            self.user.update(nausea: user.nausea + attraction.nausea_rating)
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
