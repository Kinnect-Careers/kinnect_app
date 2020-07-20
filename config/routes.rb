Rails.application.routes.draw do
  get 'static_pages/contact'
  get 'static_pages/faq'
  get 'static_pages/about'
  resources :applications
  resources :opportunities
  resources :companies
  resources :users
  root 'application#home'
end
