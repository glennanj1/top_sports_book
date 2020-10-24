class SessionsController < ApplicationController

    get '/login' do 
        erb :"sessions/login"
    end

end