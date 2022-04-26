Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # get 'users/index'
  resources :users, only: %i[index] do
    resources :foods, only: %i[index show new create destroy]
  end
end
