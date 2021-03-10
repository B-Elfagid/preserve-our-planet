class ActionsController < ApplicationController


  # GET: /actions
  get "/actions" do
     redirect_if_not_logged_in
     @actions_recently_added = Action.all.last(5)
     @current_user_action = current_user.actions
     @actions = Action.all.order(title: :asc)
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

  get "/actions/:id/associate" do
    redirect_if_not_logged_in
    action = Action.find(params["id"])
    if current_user.actions.include?(action)
      SavedAction.find_by(user: current_user, action: action).destroy
     else
      current_user.actions << action
     end 
    
    redirect "/actions"
  end
  
  
  # POST: /actions
  
    post "/actions" do
      redirect_if_not_logged_in
      action = Action.new(params["action"])
      if action.save
        current_user.actions << action
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
    req_permission
    @action = Action.find(params["id"])
    erb :"actions/edit.html"
  end

  
  # PATCH: /actions/5
  patch "/actions/:id" do
    req_permission
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
    req_permission
    @action = Action.find(params["id"])
    if @action.destroy
      redirect "/actions"
    else
      redirect "/actions/#{@action.id}"
    end
  end 
end 




  



