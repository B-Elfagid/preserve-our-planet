class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    redirect "/actions" if logged_in?
    erb :"/sessions/login.html"
  end

  # POST: /sessions
  post "/login" do
    user = User.find_by_email(params["user"]["email"])
    if user && user.authenticate(params["user"]["password"])
      session["user_id"] = user.id
      flash[:message] = "Successfully logged-in"
      redirect "/actions"
    else
      flash[:error] = "Unable to log in, please check your details"
      redirect "/login"
  end
end 


  get "/logout" do
    session.clear
    redirect "/"
  end 
 
end
