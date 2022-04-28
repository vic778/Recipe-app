Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  get 'shopping_lists/index'
  devise_for :users

  root 'foods#index'

resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new create destroy show] do
    resources :recipe_foods, only: %i[new edit create destroy update]
  end
  resources :public, only: [:index]
  resources :general, only: [:index]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
