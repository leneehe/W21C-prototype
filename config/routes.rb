Rails.application.routes.draw do
  get '/pages', to: 'pages#index', as: 'home'
  get '/pages/plan', to: 'pages#plan', as: 'plan'
  get '/pages/goal-centre', to: 'pages#goal_centre', as: 'goal_centre'
  get '/pages/track', to: 'pages#track', as: 'track'
  get '/pages/learn', to: 'pages#learn', as: 'learn'
  get '/pages/resources', to: 'pages#resources', as: 'resources'
  get '/pages/about', to: 'pages#about', as: 'about'
  get '/pages/signup', to: 'pages#signup', as: 'signup'
  get '/pages/login', to: 'pages#login', as: 'login'


  root 'pages#index'
end
