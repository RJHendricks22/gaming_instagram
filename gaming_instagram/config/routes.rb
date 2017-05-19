Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :pictures,          only: [:create, :destroy]
  resources :relationships,     only: [:create, :destroy]
  resources :comments
  
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#new"
    get "/users/sign_up", to: "devise/resgistrations#new"

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/", to: "home#index"
  get "/search", to: "home#search"
  get "/users/:id/followers", to: "users#followers"
  get "/:username", to: "pictures#index"
  get "/:username/:pic_id", to: "pictures#show"
  
end
