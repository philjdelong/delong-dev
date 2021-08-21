class Game < ActiveRecord::Base
    belongs_to :user

    def roll
        number = rand(1..10)
    end
end