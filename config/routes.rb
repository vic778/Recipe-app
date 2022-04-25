Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/index'
  resources :users, only: %i[index]

end
