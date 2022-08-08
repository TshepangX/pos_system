Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users
  resources :purchases 
  resources :products 
  resources :returns
  resources :roles
  resources :reports
  end
  
