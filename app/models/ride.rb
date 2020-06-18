class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        @att = Attraction.find_by(id: self.attraction_id)
        @user = User.find_by(id: self.user_id)
        if @user.tickets < @att.tickets && !(@user.height < @att.min_height)
            "Sorry. You do not have enough tickets to ride the #{@att.name}."
        elsif !(@user.tickets < @att.tickets) && @user.height < @att.min_height
            "Sorry. You are not tall enough to ride the #{@att.name}."
        elsif @user.tickets < @att.tickets && @user.height < @att.min_height
            "Sorry. You do not have enough tickets to ride the #{@att.name}. You are not tall enough to ride the #{@att.name}."
        else
            @user.tickets -= @att.tickets
            @user.nausea += @att.nausea_rating
            @user.happiness += @att.happiness_rating
            @user.save
            "Thanks for riding the #{@att.name}!"
        end
    end
end
