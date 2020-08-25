Rails.application.routes.draw do
    namespace :puppies, defaults:{ format: :json } do
      get :index
      get :show
      post :create
      patch :update
      delete :destroy
    end
end 
