Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :dashboard do
    get 'goals/goal_summary', to: 'goals#goal_summary', as: 'goal_summary'
    get 'plan', to: 'plan#index'
    resources :goals
    resources :medications #, :except => :show
    namespace :plan do
      resources :events, :except => :new
    end
  end

  # get 'home', to: 'pages#index', as: 'home'
  get 'plan', to: 'pages#plan', as: 'plan'
  get 'goal-centre', to: 'pages#goal_centre', as: 'goal_centre'
  get 'track', to: 'pages#track', as: 'track'
  get 'learn', to: 'pages#learn', as: 'learn'
  get 'resources', to: 'pages#resources', as: 'resources'
  get 'about', to: 'pages#about', as: 'about'
  get 'signup', to: 'pages#signup', as: 'signup'
  get 'login', to: 'pages#login', as: 'login'

  get 'dashboard', to: 'dashboard#index'

  resources :health_conditions do
    resources :tracked_health_conditions
  end

  root :to => 'pages#index'
end
