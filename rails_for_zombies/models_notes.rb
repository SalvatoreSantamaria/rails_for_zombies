
#Module 2: Models

#here is where the tweets table lives
#app/models/tweet.rb

class Tweet < ActiveRecord:: Base #class tweet inheriets from ActiveRecord
    validates_prescence_of :status #validates model does have prescense of status
    # Alternate
    validates : status, presence: true, length: {minimum: 3 }


    validates_numbericality_of :fingers
    validates_uniqueness_of :toothmarks
    validates_confirmation_of :password
    validates_acceptance_of :checkbox
    validates_length_of :password, minimum: 3
    validates_format_of :email, with: regex/i
    validates_inclusion_of : age, in 21..99
    validates_exclustion_of : age, in: 0...21, message: "You must be over 21"
end

Tweet model inherits from ActiveRecord::Base (maps the class to the table)

when we call Tweet.find(3) on the the Tweet class, and that class is a model, it goes looking inside tweets table.
    What gets returned is an instance of the class, which has the values for tweet 



#how to map models together
#under app/models/zombie.rb
class Zombie < ActiveRecord:: Base
    has_many : tweets #tweets is the table
end

#under app/models/tweet.rb
class Tweet < ActiveRecord::Base 
    belongs_to :zombie
end

ash = Zombie.find(1)

