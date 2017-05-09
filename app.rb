# All Necessary scripts are included in this 'app.rb' file and
# in the 'views/' folder.

# AD 2017.05.08

require 'sinatra'
require 'sinatra/reloader'

enable :sessions

get '/' do
    redirect '/newgame' if session[:master] == nil
	set_vars
	erb :index
end

post '/' do
	session[:message] = "" # clear any error messages
	set_vars
	player_guess = params["PLAYER_GUESS"]
	valid_guess?(player_guess)
	check = game_check(player_guess)
	@guessed_values << check
	redirect '/'
end

get '/newgame' do
	session[:master] = new_code
	session[:guesses_remaining] = 10
	session[:guessed_values] = []
	session[:game_over] = false
	session[:message] = ""
	redirect '/'
end

get '/winner' do
    set_vars
	erb :winner
end

get '/game_over' do
    set_vars
	erb :game_over
end


helpers do
	def set_vars
		@guesses_remaining = session[:guesses_remaining]
		@master = session[:master].join("")
		@guessed_values = session[:guessed_values]
		@message = session[:message]
    end

    def new_code
    	@master = []
    	4.times do
    		@master << rand(1..6).to_s
    	end
    	@master
    end

    def valid_guess?(input)
        #check guess is 4 digits between 1 and 6
        if !(input =~ /[1-6]{4}/) || input.length != 4
        	session[:message] = "Invalid guess. Must be 4 digits [1-6]"
        	redirect '/'
        end
    end

    def game_check(player_guess)
    	player_input = player_guess.dup
    	@master = session[:master]

        if (session[:guesses_remaining] > 1)
            temp = @master.dup
            correct = 0
            position = 0
            #check for perfect matches, replace in array with "x" or "y"
            for i in (0..3)
                if (player_input[i] == temp[i])
                    correct += 1
                    temp[i] = "x"
                    player_input[i] = "y"
                end
            end

            for j in (0..3)
                #compare temp[j] to all elements in guess, then change
                #found digit in [guess] to "y"
                if player_input.include?(temp[j])
                    position += 1
                    ind = player_input.index(temp[j])
                    player_input[ind] = "y"
                end
            end
            if correct == 4
                redirect '/winner'
            else
            	session[:guesses_remaining] -= 1
                return [player_guess, correct, position]
            end
        else
            redirect '/game_over'
        end
    end


end
