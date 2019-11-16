player_health = 50
monster_health = 50

current_room = rand(1..6)
monster_room = nil

game_over = false

force_to_same_room = false

puts "Welcome to RUN!"

# sleep(1)

puts "Player, you are the brave 'Survivor'. Enter your name: "

player_name = gets.chomp.capitalize.to_s

# puts "Player 2, you are the brutal 'Terror'. Enter your name: "


puts "Ok, #{player_name}, let's descend into madness... or something spooky like that..."

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

puts "It's Heads! You're up, #{player_name}. Choose a room number to move to (out of the 6) that isn't #{current_room}:  "
current_room = gets.chomp.to_i - 1

# if room_choice1 == room_choice2
#     puts "*cue the dramatic music*" 
#     sleep(1)
#     puts "Oh no! The two worlds collide! FIGHT TO SURVIVE!"
# else 
#     sleep(1)
#     puts "The journey continues..."
# end

def flee
    puts "You flee towards another room! Which one do you choose?"
    current_room = gets.chomp.to_i - 1
    force_to_same_room = false
    return current_room, force_to_same_room
end

until game_over == true

    monster_room = force_to_same_room ? current_room : rand(0..5)

    puts "New loop"

    if monster_room == current_room
        puts "Monster here. Choose move: 1 attack 2 flee"
        choice = gets.chomp

        case choice 
            
        when "1"
            puts "You lash out wildly at monster and hit damage them #{hit = rand(5..45)} health points!"
            monster_health -= hit
            if monster_health <= 0
                game_over = true
            end
            puts "The monster hits you back for #{hit = rand(5..45)}"
            if player_health <= 0
                game_over = true
            end
            puts "game over is #{game_over}"
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
            player_health += 10
            force_to_same_room = true

        when "2"
            puts "You look around..."
            force_to_same_room == true
            # monster_room = current_room

        when "3"
            puts "You nervously choose another room! Which one do you choose?"
            current_room = gets.chomp.to_i - 1
            force_to_same_room = false

        end
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

