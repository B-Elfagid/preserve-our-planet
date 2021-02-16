class ActionsController < ApplicationController

  # GET: /actions
  get "/actions" do
    redirect_if_not_logged_in
    @actions = Action.all.includes(:user).order(:username)
    erb :"/actions/index.html"
    end

  
  # GET: /actions/new
  get "/actions/new" do
    erb :"/actions/new.html"
  end

  # GET: /actions/5
  get "/actions/:id" do
    @action = Action.find(params["id"])
    erb :"/actions/show.html"
  end
  
  # POST: /actions
  post "/actions" do
    action = Action.create(params["action"])
    if action.valid?
      flash[:success] = "sucessfuly created"
      redirect "/actions"
    else
      flash[:error] = action.errors.full_messages.to_sentence
      redirect "/actions/new"
    end
  end 


  # GET: /actions/5/edit
  get "/actions/:id/edit" do
    @action = Action.find(params["id"])
    erb :"actions/edit.html"
  end

  
  # PATCH: /actions/5
  patch "/actions/:id" do
    @action = Action.find(params["id"])
   if @action.update(params["action"])
    redirect "/actions/#{@action.id}"
  else
    flash[:error] = action.errors.full_messages.to_sentence
    redirect "/actions/#{@action.id}/edit"
  end 
end 

# DELETE: /actions/5/delete
delete "/actions/:id/delete" do
  @action = Action.find(params["id"])
  if @action.destroy
   redirect "/actions"
  else
    redirect "/actions/#{@action.id}"
  end
end 
end 




  



