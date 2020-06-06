class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if nausea.to_i > happiness.to_i
            mood = 'sad'
        elsif happiness.to_i > nausea.to_i
            mood = 'happy'
        end
    end
end
