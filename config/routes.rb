Rails.application.routes.draw do
  resources :users
  get 'puppies', to: "puppies#index"
  post 'puppies', to: "puppies#create"
  get 'puppies', to: "puppies#show"
  post 'puppies', to: "puppies#update"
  post 'puppies', to: "puppies#destroy"
  
end

