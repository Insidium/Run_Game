class Character

    attr_accessor :name, :health, :win_message, :score

    def initialize(name="Monster")
        @name = name
        @health = @name == "Monster" ? 75 : 50 
        @score = 0 #debug
        @win_message = name == "Monster" ? "You fall to the floor fatally wounded. The monster comes in for the kill. You black out from the pain. Game Over!".colorize(:red) : "The monster shreeks and falls to the floor dead. You did it, #{@name}! YOU SURVIVED!".colorize(:yellow)
    end

    # action that adds 10 health points to player if not at max health
    def rest
        if @health >= 50
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
end