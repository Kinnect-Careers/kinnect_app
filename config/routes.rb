Rails.application.routes.draw do
  resources :applications
  resources :opportunities
  resources :companies
  resources :users
  root 'application#home'
end
