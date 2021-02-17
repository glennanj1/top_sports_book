class GamesController < ApplicationController
    get '/games' do
        redirect_if_not_logged_in
        Game.scrape_games
        @games = Game.all
        erb :"games/index"
    end
end