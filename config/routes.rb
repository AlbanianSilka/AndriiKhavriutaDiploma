Rails.application.routes.draw do
  resources :temperatures
  resources :automobiles
  root 'welcome#index'
end
