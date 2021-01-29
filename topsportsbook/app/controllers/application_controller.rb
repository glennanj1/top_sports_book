require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions, true
    set :session_secret, "goeagles"
  end

  get "/" do
    redirect_if_logged_in
    redirect "/login"
  end

  get "/welcome" do 
    redirect_if_not_logged_in
    erb :"/welcome"
  end

  helpers do 
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/bets"
      end
    end

  end


end
