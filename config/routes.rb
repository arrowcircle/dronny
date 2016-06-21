Rails.application.routes.draw do
  resources :brands
  devise_for :users
  root to: 'welcome#index'

  resources :brands
  resources :builds

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
