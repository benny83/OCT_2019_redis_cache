Rails.application.routes.draw do
  resources :snippets, only: :index
  root 'snippets#index'
end
