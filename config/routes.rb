Rails.application.routes.draw do
  namespace :admin do
      resources :brands
      resources :categories
      resources :collaborators
      resources :customers
      resources :devices
      resources :disrepares
      resources :feedbacks
      resources :models
      resources :operations
      resources :parts
      resources :tickets
      resources :users

      root to: "brands#index"
    end

      get 'signup' => 'users#new'
      get 'login' => 'sessions#new'
      get 'login_google' , to: redirect('/auth/google_oauth2'), as: 'login_google'
      get 'auth/:provider/callback', to: 'sessions#create'
      get 'auth/failure', to: redirect('/')
      get 'logout' => 'sessions#destroy'
      get 'contact' => 'contacts#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :customers do
      get '/pages/:page' => 'pages#show'

  resources :sessions , except: [:edit, :update]
  resources :feedbacks
  resources :devices
  resources :contacts, only: [:new, :create]

  resources :users do
    resources :feedbacks, except: [:show, :index, :new, :create]
    member do
       patch :customerize
    end
  end

  resources :tickets, exept: [:new, :create]
  resources :customers do
      resources :tickets, only: [:new, :create] do
        resources :parts
      end
  end

  resources :categories do
    resources :brands do
      resources :models, exept: [:show]
    end
  end

  resources :categories do
    resources :operations, exept: [:show]
  end

  resources :categories do
    resources :disrepares, exept: [:show]
  end

root 'pages#index'

end
