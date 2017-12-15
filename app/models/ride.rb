class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def not_enough_tickets?
        user.tickets < attraction.tickets
    end

    def too_short?
        user.height < attraction.min_height
    end
    
    def take_ride
        # binding.pry
        if not_enough_tickets? && too_short?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif too_short?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            self.user.tickets -= attraction.tickets
            self.user.nausea += attraction.nausea_rating
            self.user.happiness += attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end
end
