Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'home#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :projects
  get '/project/new', to: 'projects#create'
  get '/project/all', to: 'projects#index'
  get '/projects/:id/overview', to: 'projects#show'
  resources :invitations, only: [:index, :create, :destroy]
  resources :projects do
    resources :invitations, only: [:new, :create, :index, :destroy]
  end
  
  resources :invitations, only: [] do
    member do
      post 'accept'
      delete 'reject'
    end
  end

  resources :projects do
    resources :tasks
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
