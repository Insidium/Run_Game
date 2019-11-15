player_1_health = rand(1..50)
player_2_health = rand(1..50)

hit_chance = rand(5..45)

starting_room1 = rand(1..6)

starting_room2 = rand(1..6)

coin_toss = rand(1..2)

puts "Welcome to RUN!"

sleep(1)

puts "Player 1, you are the brave 'Survivor'. Enter your name: "

player_1 = gets.chomp.capitalize.to_s

puts "Player 2, you are the brutal 'Terror'. Enter your name: "

player_2 = gets.chomp.capitalize.to_s

puts "Ok, #{player_1} and #{player_2}, let's descend into madness... or something spooky like that..."

sleep(1)

puts "."
sleep(1)
puts "."
sleep(1)
puts "."
sleep(1)
puts "."
sleep(1)
puts "BOO!"
sleep(1)
puts "Got ya!"
sleep(1)
puts "Ok, let's go!"
sleep(1)

puts "Let's see who moves first. Flipping a cursed coin... if it's Heads it's you, #{player_1}, and Tails it's you, #{player_2}!"

coin_toss

if coin_toss == 1
    puts "It's Heads! You're up, #{player_1}. Choose a room number to move to out of the 6 that isn't #{starting_room1}:  "
    room_choice1 = gets.chomp.to_i
else 
    puts "It's Tails! You're up, #{player_2}. Choose a room number to move to out of the 6 that isn't #{starting_room2}:"
    room_choice2 = gets.chomp.to_i
end

if room_choice1 == room_choice2
    FIGHT
else
    cycle to next player turn
end

