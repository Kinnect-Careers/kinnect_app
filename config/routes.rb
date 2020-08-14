Rails.application.routes.draw do
  root   'static_pages#home'
  
  get    '/about',              to: 'static_pages#about'
  get    '/applications',       to: 'static_pages#home'
  get    '/contact',            to: 'static_pages#contact'
  get    '/faq',                to: 'static_pages#faq'
  get    '/help',               to: 'static_pages#help'
  get    '/home',               to: 'static_pages#home'
  get    '/login',              to: 'sessions#new'
  get    '/signup',             to: 'users#new'
  get    '/users',              to: 'users#index'
  
  post   '/account_activation', to: 'account_activation#edit'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  
  resources :users
  resources :account_activation, only: [:edit]
  resources :password_resets,    only: [:new, :create, :edit, :update]
end
