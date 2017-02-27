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
        print "Enter guess of 4-digits, 1-6\n> "
        @guess = gets.chomp
        #check guess is 4 digits between 1 and 6
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
            @@master << rand(1..6).to_s
        end
        @@master = ["1", "1", "2", "2"]

    end

    def self.check(guess)
        @@temp = @@master.dup
        if (@@guesses_remaining > 1)
            @correct = 0
            @position = 0
            for i in (0..3)
                if (guess[i] == @@temp[i])
                    @correct += 1
                    @@temp[i] = "x"
                elsif @@temp.include?(guess[i])
                    @position += 1
                    indx = @@temp.index(guess[i])
                    @@temp[indx] = "x"
                end
            end
            if @correct == 4
                winner
            else
                @@guesses_remaining -= 1
                puts "Correct: #{@correct}"
                puts "Out of Position: #{@position}"
                puts "Guesses Remaining: #{@@guesses_remaining}\n\n"
                return true
            end
        else
            puts "\n\nOUT OF TURNS\n\nGAME OVER!\n\n"
            exit
        end
    end

    def self.winner
        puts "\n\nYOU'VE SOLVED THE CODE!!\n\nYOU'VE SAVED THE WORLD FROM DONALD TRUMP!!\n\n"
        exit
    end
end


class Player 
    attr_accessor :name
    def initialize
        puts "What is your name?"
        @name = gets.chomp.upcase
    end
end

Mastermind.new