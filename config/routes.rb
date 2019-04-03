Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :customers do
      get '/pages/:page' => 'pages#show'
      get 'home', :to => redirect('/pages/home')

      resources :tickets do
        resources :parts
      end
      resources :users do
        resources :feedbacks, except: [:new, :create]
      end
      resources :feedbacks, only: [:new, :create]

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

      resources :customers
  # end
    root 'pages#home'
end
