Rails.application.routes.draw do
  resources :collections

  resources :links

  resources :images

  devise_for :users
  root to: 'pages#root'
end
