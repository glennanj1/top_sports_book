class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    post '/users' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/bets"
        else
        binding.pry
            erb :"users/signup"
        end
    end
end