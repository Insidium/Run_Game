# provides writing functionality to high score and results logs at the end of game

def end_of_game(value, high, user)
    puts user.win_message
    File.write("recent_games.txt", "#{user.name} - #{value == 'win' ? "Winner!" : "You lost!"}%^&", mode: "a")
    File.write("high_scores.txt", "#{user.name} - #{user.score}%^&", mode: "a")
end