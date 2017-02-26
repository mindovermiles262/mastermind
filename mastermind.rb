class Mastermind
    attr_accessor :guess
    def initialize
        system ('clear')
        puts "              ~~~ MASTERMIND ~~~\n\n"
        puts "CODEBREAKER gets 12 tries to decode secret code and"
        puts "save the world! After each guess the number of digits"
        puts "in the correct position as well as the number of"
        puts "correct digits out of position are given to CODEBREAKER\n\n"
        @player = Player.new
        @game = Game.new
        play
    end

    def play
        print "Enter 4-digit guess of digits 1-6\n> "
        @guess = gets.chomp
        while (@guess.length != 4) || !(@guess =~ /[1-6]{4}/)
            print "Invalid guess. Try again \n> "
            @guess = gets.chomp
        end
        @guess = @guess.split("")
        if Game.check(@guess)
            play
        end
    end
end

# Rules for game
class Game 
    attr_accessor :correct, :position, :guesses_remaining
    def initialize
        @@guesses_remaining = 12
        @@master = [] 
        4.times do 
            @@master << rand(0..9)
        end
        @@master = ["2","3","4","5"] # remove line for real game
    end

    def self.check(guess)
        if (@@guesses_remaining > 0)
            @correct = 0
            @position = 0
            for i in (0..3)
                if (guess[i] == @@master[i])
                    @correct += 1
                elsif
                    @@master.include?(guess[i]) ; @position += 1
                end
            end
            if @correct == 4
                winner
            else
                @@guesses_remaining -= 1
                puts "Correct: #{@correct}"
                puts "Out of Position: #{@position}"
                puts "Guesses Remaining: #{@@guesses_remaining}"
                return false
            end
        else
            puts "OUT OF TURNS\n\nGAME OVER!"
            exit
        end
        true
    end
end


class Player 
    attr_accessor :name
    def initialize
        puts "What is your name?"
        @name = gets.chomp.capitalize
    end
end

Mastermind.new