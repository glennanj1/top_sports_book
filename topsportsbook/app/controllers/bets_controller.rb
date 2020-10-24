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
        if bet.save
            redirect "bets/#{bet.id}"
        else
            redirect "todos/new"
        end
    end

    get '/bets/:id/edit' do
        @users = User.all
        @bet = Bet.find_by_id(id)
        erb :"bets/edit"
    end

    patch '/bets/:id' do
        @bet = Bet.find_by_id(params[:id])
        params.delete("_method")
        if @bet.update(params)
            redirect "/bets/#{@bets.id}"
        else
            redirect "bets/new"
        end
    end

end