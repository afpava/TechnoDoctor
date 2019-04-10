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

  resources :sessions , only: [:create, :show, :index, :destroy]
  resources :feedbacks, only:  [:new, :create, :edit, :show, :index, :update, :destroy]
  resources :devices
  resources :contacts, only: [:new, :create]

  resources :users do
    resources :feedbacks, only: [:new, :create]
    member do
       patch :customerize
    end
  end

  resources :tickets, only:  [:create, :show, :index, :edit, :update, :destroy] do
    resources :parts, only:  [:create, :destroy]
  end
  resources :customers do
      resources :tickets, only: [:new, :create]
  end

  resources :categories do
    resources :brands do
      resources :models, only: [:index, :new, :edit, :update, :destroy, :create]
    end
  end

  resources :categories do
    resources :operations, only: [:index, :new, :edit, :update, :destroy, :create]
  end

  resources :categories do
    resources :disrepares, only: [:index, :new, :edit, :update, :destroy, :create]
  end

root 'pages#index'

end
