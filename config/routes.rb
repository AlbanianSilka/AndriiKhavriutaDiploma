Rails.application.routes.draw do
  resources :automobiles
  root 'welcome#index'
end
