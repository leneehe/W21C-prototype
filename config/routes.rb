Rails.application.routes.draw do

  get 'organize/index'
  get 'conditions/new'
  get 'conditions/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, :only => [:show]
  put 'users/:id/save_condition', to: 'users#save_condition'
  resources :conditions
  namespace :dashboard do
    get 'goals/goal_summary', to: 'goals#goal_summary', as: 'goal_summary'
    get 'plan', to: 'plan#index'
    get 'track/journals', to: 'track#checklists'
    get 'plan/report', to: 'plan#report'
    get 'plan/display_report', to: 'plan#display_report'
    resources :goals
    namespace :organize do
      resources :events, except: [:new, :edit] do
        resources :checklists, only: [:create, :update, :destroy]
      end
      resources :medications #, :except => :show
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

  resources :symptoms do
    resources :tracked_symptoms
  end

  root :to => 'pages#index'
end
