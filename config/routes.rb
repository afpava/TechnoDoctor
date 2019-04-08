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
      get 'home', :to => redirect('/pages/home')

  resources :sessions , except: [:edit, :update]
  resources :feedbacks, only: [:new, :create]
  resources :customers
  resources :contacts, only: [:new, :create]

  resources :users do
    resources :feedbacks, except: [:new, :create]
    member do
       patch :customerize
    end
  end

  resources :tickets do
    resources :parts
  end

  resources :categories do
    resources :brands do
      resources :models
    end
  end

  resources :categories do
    resources :operations
  end

  resources :categories do
    resources :disrepares
  end
  
root 'pages#home'

end
