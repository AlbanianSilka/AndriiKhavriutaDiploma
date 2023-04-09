require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :indicators
  resources :mechanisms
  root 'welcome#index'
end
