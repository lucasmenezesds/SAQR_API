Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :deliveries
    end
  end
  namespace :api do
    namespace :v1 do
      resources :delivery_trucks
    end
  end
  namespace :api do
    namespace :v1 do
      resources :receive_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :load_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :storage_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :picking_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :trucks
    end
  end
  namespace :api do
    namespace :v1 do
      resources :drivers
    end
  end
  namespace :api do
    namespace :v1 do
      resources :transportation_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :cities
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
