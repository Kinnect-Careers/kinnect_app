Rails.application.routes.draw do
  root   'static_pages#home'
  
  get    '/about',              to: 'static_pages#about'
  get    '/applications',       to: 'static_pages#home'
  get    '/companies',          to: 'static_pages#home'
  get    '/contact',            to: 'static_pages#contact'
  get    '/faq',                to: 'static_pages#faq'
  get    '/help',               to: 'static_pages#help'
  get    '/home',               to: 'static_pages#home'
  get    '/login_choose',       to: 'static_pages#choose_login'
  get    '/login_user',         to: 'sessions#new'
  get    '/login_company',      to: 'sessions#new'
  get    '/signupchoose',       to: 'static_pages#signupchoose'
  get    '/signupusers',        to: 'users#new'
  get    '/signupcompanies',    to: 'companies#new'
  get    '/users',              to: 'users#index'
  
  post   '/account_activation', to: 'account_activation#edit'
  post   '/login_user',         to: 'sessions#create'
  post   '/login_company',      to: 'sessions#create'
  
  delete '/logout_company',     to: 'sessions#destroy'
  delete '/logout_user',        to: 'sessions#destroy'
  
  resources :applications
  resources :opportunities
  resources :companies
  resources :users
  resources :account_activation, only: [:edit]
  resources :password_resets,    only: [:new, :create, :edit, :update]
end
