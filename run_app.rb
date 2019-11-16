player_health = rand(1..50)
monster_health = rand(1..50)

current_room = rand(1..6)

game_over = false

puts "Welcome to RUN!"

# sleep(1)

puts "Player 1, you are the brave 'Survivor'. Enter your name: "

player_name = gets.chomp.capitalize.to_s

puts "Player 2, you are the brutal 'Terror'. Enter your name: "


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

until game_over == true
    monster_room = rand(0..5)

    if monster_room == current_room
        puts "Monster here. Choose move: 1 attack 2 flee"
        choice = gets.chomp

        case choice 
            
        when "1"
            puts "You lash out wildly at monster and hit them for #{rand(5..45)}!"

        when "2"
            puts "You flee towards another room! Which room do you choose?"
            current_room = gets.chomp.to_i - 1
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






