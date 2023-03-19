Rails.application.routes.draw do
  resources :indicators
  resources :mechanisms
  resources :temperatures
  resources :automobiles
  root 'welcome#index'
end
