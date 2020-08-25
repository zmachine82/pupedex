Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "puppies/index", to: "puppies#index"
  get "puppies/show", to: "puppies#show"
  post "puppies/create", to: "puppies#create"
  post "puppies/update", to: "puppies#update"
  post "puppies/destroy", to: "puppies#destroy"
  # I hate it ^
end
