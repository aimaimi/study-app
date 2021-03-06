Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :questions do
      resources :answers, only: [:new, :create]
    end
    collection do
      get 'search'
    end
    resources :time_managements, only: [:index, :create]
  end
end
