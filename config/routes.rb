Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'

  resources :foods, only: %i[index show new create destroy]
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create destroy update edit]
    resources :shopping_lists, only: %i[index show]
  end
  resources :public_recipes, only: [:index]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
