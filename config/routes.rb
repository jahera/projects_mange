Rails.application.routes.draw do
  namespace :tenant_admin do
    get 'dashboard/index'
  end
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # delete 'logout', to: 'sessions#destroy', as: :logout
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#tenant_dashboard" 
    resources :users, only: %i[new create index]
    resources :tenants, only: %i[new create show]
    resources :reports, only: %i[index]
  end

  namespace :tenant_admin do
    root "tenants#index"
    resources :tenants, only: %i[new create show]
    get 'dashboard', to: 'dashboard#index'
    get 'users_list', to: 'dashboard#users_list'
    get 'projects_list', to: 'dashboard#projects_list'
    get 'task_list', to: 'dashboard#task_list'
  end

  resources :projects do
    resources :tasks
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        delete 'logout', to: 'sessions#destroy'
        post 'login', to: 'sessions#create'
      end
      # devise_for :users, controllers: { sessions: 'users/sessions' }
      resources :projects, only: %i[index show create update destroy] do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
     end
    end
  end

  root "home#index"
  mount Sidekiq::Web => '/sidekiq'
end
