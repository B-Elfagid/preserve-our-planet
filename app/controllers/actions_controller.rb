class ActionsController < ApplicationController

  # GET: /actions
  get "/actions" do
    redirect_if_not_logged_in
    @actions = Action.all.includes(:user).order(:title)
    erb :"/actions/index.html"
  end

  # GET: /actions/5
  get "/actions/:id" do
    @action = Action.find(params["id"])
    erb :"/actions/show.html"
  end

  # GET: /actions/new
  get "/actions/new" do
    erb :"/actions/new.html"
  end

  # POST: /actions
  post "/actions" do
    redirect "/actions"
  end


  # GET: /actions/5/edit
  get "/actions/:id/edit" do
    erb :"/actions/edit.html"
  end

  # PATCH: /actions/5
  patch "/actions/:id" do
    redirect "/actions/:id"
  end

  # DELETE: /actions/5/delete
  delete "/actions/:id/delete" do
    redirect "/actions"
  end
end
