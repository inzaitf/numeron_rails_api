Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users" => "users#index"
  post "/user/create" => "users#create"
  post "/user/login" => "users#login"
end
