Rails.application.routes.draw do
  get 'homes/top'
  
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
