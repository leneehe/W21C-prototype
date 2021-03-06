Rails.application.routes.draw do

  get 'organize/index'
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
    get 'plan/report', to: 'plan#report'
    get 'plan/display_report', to: 'plan#display_report'
    resources :goals
    namespace :organize do
      get 'events/checklists', to: 'events#checklists'
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
  get 'learn', to: 'resources#index', as: 'learn'
  get 'learn/search', to: 'resources#search_results', as: 'article_search'
  get 'learn/:id', to: 'resources#show', as: 'article'
  get 'resources', to: 'pages#resources', as: 'resources'
  get 'about', to: 'pages#about', as: 'about'
  get 'signup', to: 'pages#signup', as: 'signup'
  get 'login', to: 'pages#login', as: 'login'

  get 'dashboard', to: 'dashboard/plan#index'

  get 'symptoms/summary', to: 'symptoms#summary', as: 'symptoms_summary'
  get 'dashboard/resources', to: 'dashboard#resources'
  resources :symptoms do
    resources :tracked_symptoms
  end

  # resources :resources

  root :to => 'pages#index'
end
