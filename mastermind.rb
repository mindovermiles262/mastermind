class Mastermind
    def initialize
        system('clear')
        system('cls')
        #welcome player to game
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
    def initialize
        @@guesses_remaining = 12
        @@master = [] 
        4.times do 
            @@master << rand(1..6).to_s
        end
    end

    def self.check(guess)
        if (@@guesses_remaining > 1)
            @@temp = @@master.dup
            @correct = 0
            @position = 0
            #check for perfect matches, replace in array with "x" or "y"
            for i in (0..3)
                if (guess[i] == @@temp[i])
                    @correct += 1
                    @@temp[i] = "x"
                    guess[i] = "y"
                end
            end
            for j in (0..3)
                #compare temp[j] to all elements in guess, then change
                #found digit in [guess] to "y"
                if guess.include?(@@temp[j])
                    @position += 1
                    ind = guess.index(@@temp[j])
                    guess[ind] = "y"
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
            puts "\nOUT OF TURNS\n\nGAME OVER!\n\nTHE CODE WAS: #{@@master.join()}\n\n"
            play_again
        end
    end

    def self.winner
        puts "\n\nYOU'VE SOLVED THE CODE\n\nAND SAVED THE WORLD FROM DONALD TRUMP!!\n\n"
        play_again
    end

    def self.play_again
        puts "Play again? (Y/N)"
        play = gets.chomp.upcase
        if play == "Y" || play == "YES"
            Mastermind.new
            exit
        else
            exit
        end
    end
end

class Player 
    def initialize
        puts "What is your name?"
        @name = gets.chomp.upcase
    end
end

Mastermind.new