class BetsController < ApplicationController

    get '/bets' do
        @bets = Bet.all
        erb :"bets/index"
    end

end