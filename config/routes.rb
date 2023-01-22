Rails.application.routes.draw do
  get 'homes/top'
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy]
  
  resources :users, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
