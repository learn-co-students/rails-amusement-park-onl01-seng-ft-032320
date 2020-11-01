class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height >= self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif self.user.height < self.attraction.min_height && self.user.tickets >= self.attraction.tickets
            return "Sorry. You are not tall enough to ride the Roller Coaster."
        elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        else
            newsmile = self.user.happiness + self.attraction.happiness_rating
            newsick = self.user.nausea + self.attraction.nausea_rating
            difference = self.user.tickets - self.attraction.tickets
            self.user.update(happiness: newsmile, nausea: newsick, tickets: difference)
            return "enjoy the ride"
        end
    end
end
