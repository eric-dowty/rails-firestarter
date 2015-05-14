Rails.application.routes.draw do

  get      '/home', to: 'home#new'
  get     '/login', to: 'session#new'
  post    '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  root 'home#new'
end
