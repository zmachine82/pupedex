Rails.application.routes.draw do
  
  namespace :users, defaults: {format: :json} do
    post :login 
    post :create
    put :update
    delete :logout
    get :me
    end
    
    namespace :puppies, defaults:{ format: :json } do
      get :index
      get :show
      post :create
      patch :update
      delete :destroy
      post :favorite
      end
    
    namespace :reviews, defaults:{ format: :json } do
      get :index
      get :show
      post :create
      patch :update
      delete :destroy
    end
  end
