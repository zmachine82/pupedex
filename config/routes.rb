Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "index", to: "puppies#index"
  get "show", to: "puppies#show"
  post "create", to: "puppies#create"
  post "update", to: "puppies#update"
  post "destroy", to: "puppies#destroy"
  # I hate it ^
end
