class BetsController < ApplicationController

    get '/bets' do
        redirect_if_not_logged_in
        @users = User.all
        @bets = Bet.all
        erb :"bets/index"
    end


    get '/bets/new' do
        redirect_if_not_logged_in
        @games = Game.all
        erb :"bets/new"
    end

    get '/bets/risky' do
        redirect_if_not_logged_in
        @bets = Bet.all.select {|bet| bet.amount >= 800}
        erb :"bets/index"
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
        current_bet
        erb :"bets/edit"      
    end

    patch '/bets/:id' do
        redirect_if_not_logged_in
        params.delete("_method")
        # @bet = current_user.bets.find_by(id: params[:id])
        # if !@bet
        #     redirect "/bets"
        # end
        current_bet
        @bet.update(params)
        redirect "/bets/#{@bet.id}"
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