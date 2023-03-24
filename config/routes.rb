Rails.application.routes.draw do
  resources :indicators
  resources :mechanisms
  resources :temperatures
  root 'welcome#index'
end
