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