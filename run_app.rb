require "colorize"
require "tty-prompt"
require "tty-font"

font = TTY::Font.new(:doom)
pastel = Pastel.new
prompt = TTY::Prompt.new

class Character

    attr_accessor :name, :health, :win_message, :score
     
    # @@points = points

    def initialize(name="Monster")
        @name = name
        @health = @name == "Monster" ? 75 : 50 #debug
        @score = 0
        @win_message = name == "Monster" ? "You fall to the floor fatally wounded. The monster comes in for the kill. You black out from the pain. Game Over!" : "The monster shreeks and falls to the floor dead. You did it, #{@name}! YOU SURVIVED!"
    end

    # action that adds 10 health points to player if not at max health
    def rest
        if @health > 50
            puts "You are already at max health!"
            @health = 50
        else 
            @health += 10
            puts "You regain 10 health points!"
        end
    end

    # action that determines damage to player and monster characters and evaluates if reached 0 health
    def hit(damage)
        @health -= damage
        if @health <= 0
            @health = 0
        end
    end

    def tally(points)
        @@points = damage + 25
    end
end

# action that allows player to change room number and pre
def flee
    puts "You flee towards another room! Which one do you choose?"
    
    current_room = gets.chomp.to_i - 1
    force_to_same_room = false
    return current_room, force_to_same_room
end

def end_of_game(value, high, user)
    puts user.win_message
    File.write("recent_games.txt", "#{user.name} - #{value == 'win' ? "Winner!" : "You lost!"}%^&", mode: "a")
    File.write("high_scores.txt", "#{user.name} - #{user.score}%^&", mode: "a")
end

quit = false

replay = true

until replay == false
    puts pastel.red(font.write("RUN!" , letter_spacing: 4))

    puts "Menu:"
    puts "1 - High Scores"
    puts "2 - Recent Results"
    puts "3 - Play Game"
    puts "4 - Quit"

    case gets.chomp
    when "1" # display high scores
        puts "High Scores"
        high_scores = File.read("high_scores.txt").split("%^&")
        p high_scores
    when "2" # display recent wins/losses
        puts "Recents"
        recent_games = File.read("recent_games.txt").split("%^&")
        p recent_games
    when "3" #play the game
        while quit == false
        
                monster = Character.new()
                
                current_room = rand(1..6)
                monster_room = nil
                
                force_to_same_room = false
                
                puts "Welcome to RUN!"
                
                # sleep(1)
                
                puts "Greetings, you are the hunted 'Survivor' in this horror story. Enter your name: "
                
                player = Character.new(gets.chomp.capitalize)
        
                # puts "Player 2, you are the brutal 'Terror'. Enter your name: "
        
                puts "Ok, #{player.name}, let's descend into madness... or something spooky like that..."
        
                # sleep(1)
                # puts "."
                # sleep(1)
                # puts "."
                # sleep(1)
                # puts "."
                # sleep(1)
                # puts "."
                # sleep(1)
                # puts "BOO!"
                # sleep(1)
                # puts "Got ya!"
                # sleep(1)
                # puts "Ok, let's go!"
                # sleep(1)
        
                # puts "Let's see who moves first. Flipping a cursed coin... if it's Heads it's you, #{player_1}, and Tails it's you, #{player_2}!"
        
                # puts "It's Heads! You're up, #{player_name}. Choose a room number to move to (out of the 6) that isn't #{current_room}:  "
        
                puts "You are in room #{current_room}. Choose another room number to move to (1 - 6): "
                current_room = gets.chomp.to_i
                until current_room > 0 and current_room <= 6 do
                    puts "That is not a valid choice. Please enter a number between 1 and 6"
                    current_room = gets.chomp.to_i
                end
                
                until monster.health <= 0 || player.health <= 0
        
                    monster_room = force_to_same_room ? current_room : rand(1..6)
        
                    if monster_room == current_room
                        puts "Aaah! The Terror is here! Choose your move: 1 - Attack OR 2 - Flee"
                        choice = gets.chomp
        
                        case choice 
                            
                        when "1"
                            puts "You lash out wildly at the Terror and wound it #{hit = rand(5..65)} health points!"
                            monster.hit(hit)
                            break if monster.health <= 0
                            puts "The Terror slashes you back for #{hit = rand(5..45)}"
                            player.hit(hit)
                            break if player.health <= 0
                            
                            puts "The Terror's health is now #{monster.health}"
                            puts "Your health is now #{player.health}"
                            
                            puts "Try to flee? Of course! You do you don't want to DIE!"
                            current_room, force_to_same_room = flee()
                        when "2"
                            current_room, force_to_same_room = flee()
                        end
        
                    else
                        puts "You enter an empty, creepy room. What do you do? 1. Rest for a while, 2. Look around for help, 3. Move to another room"
                        option = gets.chomp
        
                        case option
        
                        when "1"
                            player.rest
                            force_to_same_room = true
        
                        when "2"
                            puts "You look around..."
                            force_to_same_room = true
                        when "3"
                            puts "You nervously choose another room! Which one do you choose?"
                            current_room = gets.chomp.to_i - 1
                            force_to_same_room = false
        
                        end
                    end
                end
        
                monster.health <= 0 ? end_of_game('win', player.score, player) : end_of_game('lose', player.score, monster)

                puts "Do you want to replay - y/n?"
                replay_input = gets.chomp
                
                if replay_input == "n"
                    quit = true
                end
            end
    when "4" # quit the application
        puts pastel.red.bold("A horrifying voice growls: ")
        puts pastel.red.bold(font.write("GET OUT!"))
        replay = false
    end
end


