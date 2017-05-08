require 'sinatra'
require 'sinatra/reloader'

require './lib/game'
require './lib/mastermind'
require './lib/player'

enable :sessions

get '/' do
	"Hello world"
end