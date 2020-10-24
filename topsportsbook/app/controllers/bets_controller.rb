class BetsController < ApplicationController

    get '/bets' do
        if logged_in?
            @bets = Bet.all
            erb :"bets/index"
        else
            redirect "/login"
        end
    end


    get '/bets/new' do
        Bet.new
        erb :"bets/new"
    end

    get '/bets/:id' do 
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
        @bet = Bet.find_by_id([:id])
        if @bet.user.id == current_user.id
            erb :"bets/edit"
        else
            redirect "/bets"
        end
            
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

    delete '/bets/:id' do
        @bet = Bet.find_by_id(params[:id])
        @post.destroy
        redirect "/posts"
    end

    

end