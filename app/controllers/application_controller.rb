require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
    use Rack::MethodOverride
  end

  get "/" do
    erb :welcome
  end


  helpers do

    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

   def redirect_if_not_logged_in
     if !logged_in? 
     redirect "/login"
     end 
   end 

   def not_the_owner?(obj)
    if current_user != obj.user
      flash[:error] = "You do not have permission to acess the page!"
      redirect '/actions'
     end 
  end 
 end  
end
