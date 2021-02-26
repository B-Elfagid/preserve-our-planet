class ActionsController < ApplicationController


  # GET: /actions
  get "/actions" do
     redirect_if_not_logged_in
     @actions_recently_added = Action.all.includes(:user).order(:username).first(5)
     @actions = Action.all.order(username: :asc)
     @user_actions = current_user.actions
     @action = Action.find_by_id(session[:action_id])
     erb :"/actions/index.html"
  end

  
  # GET: /actions/new
  get "/actions/new" do
    redirect_if_not_logged_in
    erb :"/actions/new.html"
  end

  # GET: /actions/5
  get "/actions/:id" do
    redirect_if_not_logged_in
    @action = Action.find(params["id"])
    erb :"/actions/show.html"
  end
  
  # POST: /actions
  post "/actions" do
    action = Action.new(params["action"])
    if action.save
      flash[:success] = "sucessfuly created"
      redirect "/actions"
    else
      flash[:error] = action.errors.full_messages.to_sentence
      redirect "/actions/new"
    end 
  end 
  
  # GET: /actions/5/edit
  get "/actions/:id/edit" do
    redirect_if_not_logged_in
    @action = Action.find(params["id"])
    erb :"actions/edit.html"
  end

  
  # PATCH: /actions/5
  patch "/actions/:id" do
    @action = Action.find(params["id"])
    if @action.update(params["action"])
      uploader = ImageUploader.new
      uploader.store!(params["action"]["image"])

       redirect "/actions/#{@action.id}"
    else
       flash[:error] = action.errors.full_messages.to_sentence
       redirect "/actions/#{@action.id}/edit"
     end 
  end 

# DELETE: /actions/5/delete
  delete "/actions/:id/delete" do
    redirect_if_not_logged_in
    @action = Action.find(params["id"])
    if @action.destroy
      redirect "/actions"
    else
      redirect "/actions/#{@action.id}"
    end
  end 
end 




  



