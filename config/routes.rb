Rails.application.routes.draw do
  get '/pages', to: 'pages#index', as: 'pages'
  root 'home#index'
end
