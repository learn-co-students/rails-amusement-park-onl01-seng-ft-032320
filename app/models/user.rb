class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates_inclusion_of :admin, in: [true, false]

  def mood 
    happiness > nausea ? "happy" : "sad"
  end 
  
end
