class UsersController < ApplicationController



 get "/about" do
   erb :"users/about.html"
 end

 get "/news" do
   erb :"users/news.html"
 end

 get "/users" do
   @users = User.all
   erb :"/users/index.html"
 end




  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params["id"])
    @actions = @user.actions
    @actions = @actions.sort_by{|a| a.username}
    erb :"/users/show.html"
  end
 
  

  

  # GET: /users/5/edit
  # get "/users/:id/edit" do
  # erb :"/users/edit.html"
  # end

  # PATCH: /users/5
  # patch "/users/:id" do
  #  redirect "/users/:id"
  # end

  # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  # redirect "/users"
  # end
 end

