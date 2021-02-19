class BetsController < ApplicationController

    get '/bets' do
        redirect_if_not_logged_in
        @users = User.all
        @bets = Bet.all
        erb :"bets/index"
    end


    get '/bets/new' do
        redirect_if_not_logged_in
        @users = User.all
        @games = Game.all
        erb :"bets/new"
    end

    get '/bets/:id' do 
        redirect_if_not_logged_in
        @bet = Bet.find_by_id(params[:id])
        erb :"bets/show"
    end

    post '/bets' do
        redirect_if_not_logged_in
        @bet = Bet.new(params)
        @bet.user_id = current_user.id

        if @bet.save
            redirect "bets/#{@bet.id}"
        else
            redirect "bets/new"
        end
    end

    get '/bets/:id/edit' do
        redirect_if_not_logged_in

        @users = User.all
        @bet = Bet.find(params[:id])
        
        if @bet.user_id == current_user.id
            erb :"bets/edit"
        else
            redirect "/bets"
        end
            
    end

    patch '/bets/:id' do
        redirect_if_not_logged_in
        params.delete("_method")
        if current_bet
            @bet.update(params)
            redirect "/bets/#{@bet.id}"
        else
            redirect "/bets"
        end
    end

    delete '/bets/:id' do
        redirect_if_not_logged_in
        @bet = Bet.find(params[:id])
        
        if @bet.user_id == current_user.id && current_bet
            @bet.delete
        end
        redirect "/bets"
    end

    

end