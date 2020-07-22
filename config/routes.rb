Rails.application.routes.draw do
  root   'static_pages#home'
  
  get    '/home',            to: 'static_pages#home'
  get    '/contact',         to: 'static_pages#contact'
  get    '/faq',             to: 'static_pages#faq'
  get    '/about',           to: 'static_pages#about'
  get    '/help',            to: 'static_pages#help'
  get    '/signupchoose',    to: 'static_pages#signupchoose'
  get    '/signupusers',     to: 'users#new'
  get    '/signupcompanies', to: 'companies#new'
  get    '/users',           to: 'static_pages#home'
  get    '/companies',       to: 'static_pages#home'
  get    '/applications',    to: 'static_pages#home'
  get    '/login_user',      to: 'sessions#new'
  post   '/login_user',      to: 'sessions#create'
  delete '/logout_user',     to: 'sessions#destroy'
  
  resources :applications
  resources :opportunities
  resources :companies
  resources :users
end
