Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "private_parkings#index"
  # Routes for the Private_parking resource:
  # CREATE
  get "/private_parkings/new", :controller => "private_parkings", :action => "new"
  post "/create_private_parking", :controller => "private_parkings", :action => "create"

  # READ
  get "/private_parkings", :controller => "private_parkings", :action => "index"
  get "/private_parkings/:id", :controller => "private_parkings", :action => "show"

  # UPDATE
  get "/private_parkings/:id/edit", :controller => "private_parkings", :action => "edit"
  post "/update_private_parking/:id", :controller => "private_parkings", :action => "update"

  # DELETE
  get "/delete_private_parking/:id", :controller => "private_parkings", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
