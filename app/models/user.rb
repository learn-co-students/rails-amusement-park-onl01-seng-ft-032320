class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    #validates :password, presence: true
    has_secure_password



    def mood
        if self.nausea.to_s.empty? || self.happiness.to_s.empty?
            "neutral"
        elsif self.nausea > self.happiness 
                "sad"
        else 
                "happy"
        end 

    end 
end
