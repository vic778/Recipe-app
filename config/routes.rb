Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'foods#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create destroy]
end
