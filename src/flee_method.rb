# action that allows player to change room number and prepare for the next interaction

def flee
    puts "You flee towards another room! Which one do you choose?"
    
    current_room = gets.chomp.to_i
    force_to_same_room = false
    return current_room, force_to_same_room
end