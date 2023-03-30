require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :indicators
  resources :mechanisms
  resources :temperatures
  root 'welcome#index'
end
