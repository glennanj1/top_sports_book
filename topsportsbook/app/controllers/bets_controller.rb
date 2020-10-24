class BetsController < ApplicationController

    get '/bets' do
        @bets = Bet.all
        erb :"bets/index"
    end

    get '/bets/new' do
        Bet.new
        erb :"bets/new"
    end

    get '/bets/:id' do 
        id = params[:id]
        @bet = Bet.find_by_id(id)
        erb :"bets/show"
    end

    post '/bets' do
        bet = Bet.new(params)
    end
end