class GamesController < ApplicationController
    
    def create
        stale_game = Game.find_by(user_id: current_user.id)
        if stale_game
            stale_game.destroy
        end

        game = Game.new(user_id: current_user.id)
        if game.save
            game.update(current_roll: game.roll)
        else
            flash[:error] = "No Dice..."
        end
        redirect_to "/game"
    end

    def higher
        game = Game.find_by(user_id: current_user.id)
        if game
            roll = game.roll
            if roll > game.current_roll
                game.update(current_score: game.current_score + 1)
                if game.current_score == 10
                    current_user.update(lifetime_wins: current_user.lifetime_wins + 1)
                    flash[:win] = "Winner!"
                else
                    flash[:correct] = "Correct"
                end
            else
                game.update(strikes: game.strikes + 1)
                if game.strikes == 3
                    current_user.update(lifetime_losses: current_user.lifetime_losses + 1)
                    flash[:win] = "Strike out!"
                else
                    flash[:incorrect] = "Incorrect"
                end
            end
            game.update(current_roll: roll)
        else
            flash[:error] = "No Dice..."
        end
        redirect_to "/game"
    end
    
    def lower
        game = Game.find_by(user_id: current_user.id)
        if game
            roll = game.roll
            if roll < game.current_roll
                game.update(current_score: game.current_score + 1)
                if game.current_score == 10
                    current_user.update(lifetime_wins: current_user.lifetime_wins + 1)
                    flash[:win] = "Winner!"
                else
                    flash[:correct] = "Correct"
                end
            else
                game.update(strikes: game.strikes + 1)
                if game.strikes == 3
                    current_user.update(lifetime_losses: current_user.lifetime_losses + 1)
                    flash[:win] = "Strike out!"
                else
                    flash[:incorrect] = "Incorrect"
                end
            end
            game.update(current_roll: roll)
        else
            flash[:error] = "No Dice..."
        end
        redirect_to "/game"
    end
    
    def reset_stats
        if current_user
            current_user.update(lifetime_wins: 0, lifetime_losses: 0)
        else
            flash[:error] = "Please login"
        end
        redirect_to "/game"
    end
end