Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :questions, only: [:new, :create, :index, :show, :edit, :update] do
    resources :answers, only: [:new, :create]
  end
  resources :time_managements, only: [:index]
end
