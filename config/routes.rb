Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # get 'users/index'
  resources :users, only: %i[index] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: %i[index new show create destroy] do
      resources :recipe_foods, only: %i[new create show destroy]
    end
  end
end
