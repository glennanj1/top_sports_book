class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end


    post '/users' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/welcome"
        else
            erb :"users/signup"
        end
    end

    get '/users/account' do 
        redirect_if_not_logged_in
        @users = current_user
        erb :"users/account"
    end

    get '/users/:id/edit' do
        redirect_if_not_logged_in
        @user = User.find(params[:id])

        if @user.id == current_user.id
            erb :"users/edit"
        else
            redirect "users/signup"
        end
    end

    patch '/users/:id' do 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        params.delete("_method")
        if @user.update(params)
            redirect "/users/account"
        else
            redirect "/welcome"
        end

    end

    delete '/users/:id' do 
        redirect_if_not_logged_in
        @user = User.find(params[:id])

        if @user.id == current_user.id
            @user.delete 
        end
        redirect "/users/signup"
    end




end