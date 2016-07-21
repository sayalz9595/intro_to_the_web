require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do

    erb(:index)
  end

  post '/post-names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)

    redirect '/play'
  end

  get '/play' do

    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turns
    erb(:attack)
  end

  # get '/switch-turn' do
  #   @game = $game
  #   @game.switch_turn
  #   erb(:play)
  #
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0


end
