Rails.application.routes.draw do
  
  resources  :orders, only: [:create, :show]
  resources   :items, only: [:index] 
  resources    :cart, only: [:index, :create, :update]

  get        '/home', to: 'home#new'
  get       '/login', to: 'session#new'
  post      '/login', to: 'session#create'
  delete   '/logout', to: 'session#destroy'

  root 'home#new'
end
