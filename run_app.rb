class Character

    attr_accessor :name, :health

    def initialize(name="Monster")
        @health = 50
        @name = name
    end

    def rest
        @health += 10
        if @health > 50
            puts "You are at max health!"
            @health = 50
        end
    end

    def hit
        @health -= hit
        if @health <= 0
            puts "GAME OVER MAN!" 
            @health = 0
        end 
    end
end


quit = false

def flee
    puts "You flee towards another room! Which one do you choose?"
    current_room = gets.chomp.to_i - 1
    force_to_same_room = false
    return current_room, force_to_same_room
end

# def health_recap

# end

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

    puts "Choose a room number to move to (out of the 6): "
    current_room = gets.chomp.to_i - 1

# if room_choice1 == room_choice2
#     puts "*cue the dramatic music*" 
#     sleep(1)
#     puts "Oh no! The two worlds collide! FIGHT TO SURVIVE!"
# else 
#     sleep(1)
#     puts "The journey continues..."
# end
    
    until monster.health <= 0 || player.health <= 0

        monster_room = force_to_same_room ? current_room : rand(0..5)

        if monster_room == current_room
            puts "Monster here. Choose move: 1 - Attack OR 2 - Flee"
            choice = gets.chomp

            case choice 
                
            when "1"
                puts "You lash out wildly at monster and hit damage them #{hit = rand(5..45)} health points!"
                monster.health -= hit
                if monster.health <= 0
                    
                    break
                end
                puts "The monster hits you back for #{hit = rand(5..45)}"
                player.health -= hit
                if player.health <= 0

                    break
                end
                
                puts "The monster's health is #{monster.health}"
                puts "Your health is #{player.health}"
                
                puts "Try to flee? Of course you do you don't want to die."
                current_room, force_to_same_room = flee()
            when "2"
                current_room, force_to_same_room = flee()
            end

        else
            puts "You enter an empty room. What do you do? 1. Rest, 2. Look around, 3. Move to next room (choose)"
            option = gets.chomp

            case option

            when "1"
                puts "You rest and regain 10 health."
                player.health += 10
                force_to_same_room = true

            when "2"
                puts "You look around..."
                force_to_same_room = true
                puts "The monster's health is #{monster.health}"
                puts "Your health is #{player.health}"

            when "3"
                puts "You nervously choose another room! Which one do you choose?"
                current_room = gets.chomp.to_i - 1
                force_to_same_room = false

            end
        end
    end
    puts "Monster's health: #{monster.health}"
    puts "#{player.name}'s health: #{player.health}"
    
    player_win = "The monster shreeks and falls to the floor dead. You did it, #{player.name}! YOU SURVIVED!"
    monster_win = "You fall to the floor fatally wounded. The monster comes in for the kill. You black out from the pain. Game Over, #{player.name}!"
    
    puts monster.health <= 0 ? player_win : monster_win
    
    puts "Do you want to quit - y/n?"
    user_input = gets.chomp
    
    if user_input == "y"
        quit = true
    end
end



    #     puts "Select your action #{player_name}: 1 - Attack, 2 - RUN!"
    #     action_choice_1 = gets.chomp.to_i
                
    #     if action_choice_1 == "1"
    #             puts "You lash out wildly at #{player_2} and hit for #{hit_chance}!"
    #     else
    #         puts "You flee towards another room! Which room do you choose?"
    #         player_1_move = gets.chomp.to_i
    #     end
    # end




# if monster_room is set 
#     dont come back to rand loop
# end

