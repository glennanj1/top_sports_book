class BetsController < ApplicationController
    get '/bets' do
        erb :"bets/index"
    end

end