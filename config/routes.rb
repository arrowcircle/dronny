Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :builds
  resources :tags, only: [:index, :edit, :destroy]
  get 'tags/:tagname', to: 'builds#withtag', as: :tagname
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
