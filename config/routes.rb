Rails.application.routes.draw do
  get 'homes/top'
  
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy]
  devise_for :users
  
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
