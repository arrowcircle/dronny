Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :builds
  get 'tags/:tag', to: 'builds#index', as: :tag
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
