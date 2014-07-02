Bloccitoff::Application.routes.draw do

  devise_for :users

  resources :todos

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
