class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides


    def mood
       return "sad" if nausea > happiness
       return "happy" if nausea < happiness
    end

 end 