Bloccitoff::Application.routes.draw do

  devise_for :users

  resources :lists do 
    resources :todos
  end  

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
