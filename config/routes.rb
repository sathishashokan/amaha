Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/new", to: "users#new"
  post "/user/signup", to: "users#create"
  get "/user", to: "users#show"
  get "/user/profile", to: "users#profile"
  
  get "/session/new", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :tasks, only: %i[new create index edit update destroy]
end
