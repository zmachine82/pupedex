Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "puppies", to: "puppies#index"
  get "puppies", to: "puppies#show"
  post "puppies", to: "puppies#create"
  post "puppies", to: "puppies#update"
  post "puppies", to: "puppies#destroy"
end
