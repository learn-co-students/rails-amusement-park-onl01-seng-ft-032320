class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride 
    if !tall_enough && !enough_tickets
      not_tickets_not_tall
    elsif !tall_enough 
      not_tall 
    elsif !enough_tickets 
      not_tickets
    else 
      start_ride
    end 
  end 

  def tall_enough 
    self.user.height >= self.attraction.min_height
  end 

  def enough_tickets 
    self.user.tickets >= self.attraction.tickets
  end 

  def not_tall
    "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  end 

  def not_tickets
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end 

  def not_tickets_not_tall
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}." 
  end 

  def start_ride 
    new_tickets = self.user.tickets -= self.attraction.tickets 
    new_happiness = self.user.happiness += self.attraction.happiness_rating 
    new_nausea = self.user.nausea += self.attraction.nausea_rating

    self.user.update(:happiness => new_happiness, :nausea => new_nausea, :tickets => new_tickets)

    "Thanks for riding the #{self.attraction.name}!"
  end 

end
